// Import standard libraries
import Array "mo:base/Array";
import Nat "mo:base/Nat";

import Types "./types";

module Utils {

  type Event = Types.Event;
  // type Person = Types.Person;
  // type LatLong = Types.LatLong;

  public func add(
    events : [Event],
    id: Text,
    name: Text,
    location: Text,
    date: Text,
    start_time: Text,
    address: Text,
    additional_information: Text,
    host: Text,
    country_code: Text,
    lat: Float,
    long: Float,
    organizer_name: Text,
    organizer_email: Text,
    organizer_phone: Text
    ) : [Event] {

    let event : Event = {
        id = id;
        name = name;
        location= location;
        date= date;
        start_time= start_time;
        address= address;
        additional_information= additional_information;
        host= host;
        country_code= country_code;
        lat= lat;
        long=long;
        organizer_name=organizer_name;
        organizer_email=organizer_email;
        organizer_phone= organizer_phone;
    };
    Array.append<Event>([event], events)
};


};