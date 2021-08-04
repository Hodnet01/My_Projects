namespace ClassLibrary
{
    public class Car
    {
        public string Number { get; set; }
        public string OwnersName { get; set; }

        public Car(string number, string ownersName)
        {
            Number = number;
            OwnersName = ownersName;
        }
    }
}
