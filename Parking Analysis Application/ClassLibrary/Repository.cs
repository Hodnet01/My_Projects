using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Newtonsoft.Json;

namespace ClassLibrary
{
    public class Repository  // is used to transport data to file-storage and between code files
    {
        const string _logPath = "../../../logs.csv";
        const string _statePath = "../../../states.json";

        public int CountOfFloors { get; set; } = 0;
        public int CountOfPlacesPerFloor { get; set; } = 0;

        public List<Place> CurrentFloorPlaces { get; set; }
        public List<Place> AllPlaces { get; set; } = new List<Place>();

        public void WriteState(Parking parking)  // creates or recreates save-file
        {
            using (StreamWriter sw = new StreamWriter(_statePath, false, Encoding.UTF8))
            {
                string state = JsonConvert.SerializeObject(parking);
                sw.Write(state + "\n");
            }
        }

        public void WriteLog(string mode, Place place)  // writes the log
        {
            using (StreamWriter sw = new StreamWriter(_logPath, true, Encoding.UTF8))
            {
                string log = $"{mode},{DateTime.Now},{place.Id},{place.IsReserved}," +
                    $"{(place.IsTaken ? place.CurrentCar.Number : "")},{(place.IsTaken ? place.CurrentCar.OwnersName : "")}," +
                    $"{(place.IsReserved ? place.ReservingCar.Number : "")},{(place.IsReserved ? place.ReservingCar.OwnersName : "")}\n";
                sw.Write(log);
            }
        }

        public void WriteLog(string mode)  // used to separate data in log-file
        {
            using (StreamWriter sw = new StreamWriter(_logPath, true, Encoding.UTF8))
            {
                string log = $"{mode}\n";
                sw.Write(log);
            }
        }
    }
}
