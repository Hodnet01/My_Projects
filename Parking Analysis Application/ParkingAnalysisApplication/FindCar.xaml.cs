using System.Collections.Generic;
using System.Linq;
using System.Windows;
using ClassLibrary;

namespace ParkingAnalysisApplication
{
    public partial class FindCar : Window
    {
        private List<Place> _listForSearch;

        public FindCar(List<Place> takenPlaces)
        {
            InitializeComponent();

            _listForSearch = takenPlaces;

            ButtonCancelAddition.Click += ButtonCancelAddition_Click;
            ButtonConformAddition.Click += ButtonConformAddition_Click;
        }

        private void ButtonConformAddition_Click(object sender, RoutedEventArgs e)
        {
            List<string> resultingList;
            string carNumber = TextBoxCarNumber.Text.Trim().ToLower();
            string ownersName = TextBoxOwnersName.Text.Trim();

            bool firstCondition = string.IsNullOrEmpty(carNumber);
            bool secondCondition = string.IsNullOrEmpty(ownersName);

            if (firstCondition && secondCondition)
            {
                MessageBox.Show("At least one field must be not empty", "Error", MessageBoxButton.OK, MessageBoxImage.Error);                                            // Giving feedback
                return;
            }

            if (!firstCondition)
            {
                resultingList = _listForSearch.Where(x => x.CurrentCar.Number == carNumber)
                                              .Select(x => "Place: " + x.Id + "  Owner`s Name: " + x.CurrentCar.OwnersName)
                                              .ToList<string>();
            }
            else if (!secondCondition)
            {
                resultingList = _listForSearch.Where(x => x.CurrentCar.OwnersName == ownersName)
                                              .Select(x => "Place: " + x.Id + "  Car`s Number: " + x.CurrentCar.Number)
                                              .ToList<string>();
            }
            else
            {
                resultingList = _listForSearch.Where(x => x.CurrentCar.Number == carNumber && x.CurrentCar.OwnersName == ownersName)
                                              .Select(x => "Place: " + x.Id)
                                              .ToList<string>();
            }

            if (resultingList.Count == 0)
                MessageBox.Show("Such car not found", "Response", MessageBoxButton.OK, MessageBoxImage.Information);
            else
            {
                string messageBoxName = $"Car with {(!firstCondition ? "Number " + carNumber : "")}" +
                    $"{(!firstCondition && !secondCondition ? " and ": "")}" +
                    $"{(!secondCondition ? "Owner " + ownersName : "")} found at:";

                string response = string.Join("\n", resultingList);
                MessageBox.Show(response, messageBoxName, MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void ButtonCancelAddition_Click(object sender, RoutedEventArgs e)
        => Close();
    }
}
