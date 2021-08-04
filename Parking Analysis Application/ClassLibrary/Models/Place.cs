namespace ClassLibrary
{
    public class Place
    {
        public string Id { get; }
        public bool IsTaken { get; set; } = false;
        public bool IsReserved { get; set; } = false;
        public Car CurrentCar { get; set; } = null;
        public Car ReservingCar { get; set; } = null;
        public string StringState  // is used to show place`s state in the UI
        {
            get => "Place is " + (IsTaken ? "taken " : "free ") + (IsReserved ? "and reserved " : "")
                + (IsTaken||IsReserved ? $"by {(CurrentCar != null ? CurrentCar.OwnersName : ReservingCar.OwnersName)}" :""); // how nervous
        }

        public Place(string id)
        {
            Id = id;
        }
    }
}
