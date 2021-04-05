import Float "mo:base/Float";

module {
  public type Event = {
    id: Text;
    name: Text;
    location: Text;
    date: Text;
    start_time: Text;
    address: Text;
    additional_information: Text;
    host: Text;
    country_code: Text;
    lat: Float;
    long: Float;
    organizer_name: Text;
    organizer_email: Text;
    organizer_phone: Text;
  };

  // public type Person = {
  //   name: Text;
  //   phone: Text;
  //   email: Text;
  // };

  // public type LatLong = {
  //   lat: Float;
  //   long: Float;
  // }
};