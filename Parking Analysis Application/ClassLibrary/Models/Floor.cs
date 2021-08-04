using System.Collections.Generic;

namespace ClassLibrary
{
    public class Floor
    {
        public int Id { get; }
        public int CountOfPlaces { get; set; }
        public List<Place> Places { get; set; } = new List<Place>();

        public Floor(int countOfPlaces, int id)
        {
            Id = id;
            CountOfPlaces = countOfPlaces;
            for (int i = 1; i <= countOfPlaces; i++)
            {
                string placeId = id.ToString() + "-" + i.ToString();
                Place currPlace = new Place(placeId);
                Places.Add(currPlace);
            }
        }
    }
}
