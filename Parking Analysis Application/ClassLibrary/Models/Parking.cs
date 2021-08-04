using System;
using System.Collections.Generic;

namespace ClassLibrary
{
    public class Parking
    {
        public int CountOfFloors { get; set; }
        public int CountOfPlacesOnFloor { get; set; }
        public List<Floor> Floors { get; set; } = new List<Floor>();

        public Parking(int countOfFloors, int countOfPlacesOnFloor)
        {
            CountOfFloors = countOfFloors;
            CountOfPlacesOnFloor = countOfPlacesOnFloor;
            Floors = new List<Floor>();
            for (int i = 1; i <= countOfFloors; i++)
            {
                Floor currFloor = new Floor(countOfPlacesOnFloor, i);
                Floors.Add(currFloor);
            }
        }
    }
}
