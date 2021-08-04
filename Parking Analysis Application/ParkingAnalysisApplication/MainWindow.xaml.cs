using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows;
using ClassLibrary;
using Newtonsoft.Json;

namespace ParkingAnalysisApplication
{
    public partial class MainWindow : Window
    {
        private const string _stateFile = "../../../states.json";
        private Repository _repository = new Repository();
        private Parking _parking;


        public MainWindow()
        {
            InitializeComponent();


            Parking parking;

            if (File.Exists(_stateFile))  // check if state.json file exists and is not empty
            {

                string data;
                using (StreamReader sr = new StreamReader(_stateFile))
                    data = sr.ReadToEnd();


                if (string.IsNullOrEmpty(data))
                    parking = CreateParking();                               
                else
                {
                    parking = JsonConvert.DeserializeObject<Parking>(data);
                    _repository.CountOfFloors = parking.CountOfFloors;
                    _repository.CountOfPlacesPerFloor = parking.CountOfPlacesOnFloor;
                }

            }
            else
                parking = CreateParking();                               


            _parking = parking;


            if (parking.CountOfFloors != 0)  // to check if user entered necessary information
            {                               // if all is ok program continues else window closes
                FillListAndRepository();


                ButtonAddCar.Click += ButtonAddCar_Click;                                         
                ButtonRemoveCar.Click += ButtonRemoveCar_Click;                     
                ButtonReservePlace.Click += ButtonReservePlace_Click;               
                ButtonFindCar.Click += ButtonFindCar_Click;                         
                ListBoxFloors.MouseDoubleClick += ListBoxFloors_MouseDoubleClick;   
                ButtonDeleteReservation.Click += ButtonDeleteReservation_Click;     
                ButtonClearLogs.Click += ButtonClearLogs_Click;                     
            }
            else
                Close();
        }

        

        private Parking CreateParking()                                                      // method creates the Garage object
        {
            ParkingCreating garageCreating = new ParkingCreating(_repository);                 
            garageCreating.ShowDialog();

            int countOfFloors = _repository.CountOfFloors;                                  
            int countOfPlaces = _repository.CountOfPlacesPerFloor;                           

            Parking garage = new Parking(countOfFloors, countOfPlaces);                        
            _repository.WriteLog($"CreatedGarageSize{countOfFloors}x{countOfPlaces}");
            return garage;                                                                   
        }

        private void FillListAndRepository()
        {
            _repository.CurrentFloorPlaces = _parking.Floors[0].Places;

            _repository.AllPlaces = new List<Place>();
            foreach (Floor floor in _parking.Floors)
                _repository.AllPlaces.AddRange(floor.Places);

            _repository.WriteState(_parking);

            ListBoxFloors.ItemsSource = _parking.Floors;
            ListBoxPlaces.ItemsSource = _repository.CurrentFloorPlaces;
        }

        protected override void OnClosed(EventArgs e)  // stop program if the Main Window is closed
        {
            base.OnClosed(e);
            Application.Current.Shutdown();
        }

        private void ButtonDeleteReservation_Click(object sender, RoutedEventArgs e)    // Event that cancels reservation and keeps the taken state
        {
            if (ListBoxPlaces.SelectedItem != null)                                     
            {
                Place selectedPlace = (Place)ListBoxPlaces.SelectedItem;
                selectedPlace.IsReserved = false;
                _repository.WriteLog("Delete Reservation", selectedPlace);

                ListBoxPlaces.Items.Refresh();
                _repository.WriteState(_parking);
            }
        }

        private void ListBoxFloors_MouseDoubleClick(object sender, System.Windows.Input.MouseButtonEventArgs e) // Recollects list of Places with Places of chosen floor
        {
            if (ListBoxFloors.SelectedItem != null)
            {
                Floor currentFloor = (Floor)ListBoxFloors.SelectedItem;
                ListBoxPlaces.ItemsSource = currentFloor.Places;

                ListBoxPlaces.Items.Refresh();
            }
        }

        private void ButtonFindCar_Click(object sender, RoutedEventArgs e)  // mathod to find car by it`s owner`s name or number
        {
            List<Place> takenPlaces = _repository.AllPlaces.Where(x => x.IsTaken).ToList<Place>();
            FindCar findCar = new FindCar(takenPlaces);
            findCar.Owner = this;
            findCar.ShowDialog();
        }

        private void ButtonReservePlace_Click(object sender, RoutedEventArgs e)              // Creates Reservation by the car number 
        {                                                                                    // Can be done only with free && not reserved places 
            string mode = "Reserve Place";
            CarInfo carInfo = new CarInfo(_repository, mode);
            if (carInfo.IsFilled == true)
            {
                carInfo.Owner = this;
                carInfo.ShowDialog();
            }
            ListBoxPlaces.Items.Refresh();
            _repository.WriteState(_parking);
        }

        private void ButtonRemoveCar_Click(object sender, RoutedEventArgs e)                // Removes current car from the choosen place
        {
            if (ListBoxPlaces.SelectedItem != null)
            {
                Place selectedPlace = (Place)ListBoxPlaces.SelectedItem;
                selectedPlace.CurrentCar = null;
                selectedPlace.IsTaken = false;
                _repository.WriteLog("Remove Car", selectedPlace);

                ListBoxPlaces.Items.Refresh();
                _repository.WriteState(_parking);
            }
        }

        private void ButtonAddCar_Click(object sender, RoutedEventArgs e)                   // Adds car to the place 
        {                                                                                   // can be done with any place except taken ones
            string mode = "Add Car";
            CarInfo carInfo = new CarInfo(_repository, mode);
            if (carInfo.IsFilled == true)
            {
                carInfo.Owner = this;
                carInfo.ShowDialog();
            }
            ListBoxPlaces.Items.Refresh();
            _repository.WriteState(_parking);
        }
       
        private void ButtonClearLogs_Click(object sender, RoutedEventArgs e)                // Deletes the saving file and returns the garage with the same
        {                                                                                   // count of floors and places if new data is not entered else returns the garage with given new parametres
            MessageBox.Show("Close ParkingCreating Window to create parking of same size", "Feature", MessageBoxButton.OK, MessageBoxImage.Information);
            ParkingCreating garageCreating = new ParkingCreating(_repository);                
            _parking = CreateParking();


            File.Delete(_stateFile);

            FillListAndRepository();

            ListBoxPlaces.Items.Refresh();
            ListBoxFloors.Items.Refresh();
            _repository.WriteLog("EndOfSession");
            _repository.WriteState(_parking);
        }
    }
}
