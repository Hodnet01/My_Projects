using System.Linq;
using System.Windows;
using ClassLibrary;

namespace ParkingAnalysisApplication
{
    public partial class CarInfo : Window
    {
        private string _mode;
        private readonly Repository _repository;
        public bool IsFilled { get; set; } = true;

        public CarInfo(Repository repository, string mode)
        {
            InitializeComponent();

            _mode = mode;
            _repository = repository;

            TextBlockMode.Text = mode;

            if (mode == "Reserve Place")
                ComboBoxPlaces.ItemsSource = repository.AllPlaces.Where(x => !x.IsTaken && !x.IsReserved);
            else
                ComboBoxPlaces.ItemsSource = repository.AllPlaces.Where(x => !x.IsTaken);

            ButtonCancelAddition.Click += ButtonCancelAddition_Click;
            ButtonConformAddition.Click += ButtonConformAddition_Click;

            if (ComboBoxPlaces.Items.Count == 0)
            {
                MessageBox.Show("There is no possible places", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                IsFilled = false;
                Close();
            }
        }


        private void ButtonConformAddition_Click(object sender, RoutedEventArgs e)
        {
            if (ComboBoxPlaces.SelectedItem != null)
            {
                Place selectedPlace = (Place)ComboBoxPlaces.SelectedItem;

                string carNumber = TextBoxCarNumber.Text.Trim().ToLower();
                string ownersName = TextBoxOwnersName.Text.Trim();

                if (string.IsNullOrEmpty(carNumber) || string.IsNullOrEmpty(ownersName))
                {
                    MessageBox.Show("Both field must be not empty", "Error", MessageBoxButton.OK, MessageBoxImage.Error);                                            // Giving feedback
                    return;
                }

                if (_mode == "Add Car")
                {
                    if (selectedPlace.IsReserved && (selectedPlace.ReservingCar.Number != carNumber || selectedPlace.ReservingCar.OwnersName != ownersName))
                    {
                        MessageBox.Show($"This place is reserved by {selectedPlace.ReservingCar.OwnersName} - {selectedPlace.ReservingCar.Number}",
                            "Error", MessageBoxButton.OK, MessageBoxImage.Error);  
                        return;
                    }
                    else
                    {
                        selectedPlace.CurrentCar = new Car(carNumber, ownersName);
                        selectedPlace.IsTaken = true;
                    }
                }
                else
                {
                    selectedPlace.ReservingCar = new Car(carNumber, ownersName);
                    selectedPlace.IsReserved = true;
                }
                _repository.WriteLog(_mode, selectedPlace);
                Close();
            }
            else
                MessageBox.Show("You have to choose one of the given places", "Error", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void ButtonCancelAddition_Click(object sender, RoutedEventArgs e)
            => Close();
    }
}
