import Array "mo:base/Array";
import Float "mo:base/Float";
import Text "mo:base/Text";
import Types "./types";
import Utils "./utils";

actor Earthday {
    type Event = Types.Event;
    // type LatLong = Types.LatLong;
    // type Person = Types.Person;

    var nextId : Nat = 1;
    var events : [Event] = [];

    public query func getEvents() : async [Event] {
        return events;
    };

    public func createEvent(
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
    ) : async () {
        events := Utils.add(
            events,
            id,
            name,
            location,
            date,
            start_time,
            address, 
            additional_information,
            host,
            country_code,
            lat,
            long,
            organizer_name,
            organizer_email,
            organizer_phone
            );
    };

    public func findEvent(keyword: Text): async [Event] {
      var results_events: [Event] = [];
      for (event in events.vals()) {
          if(Text.contains(event.name, #text(keyword)) or Text.contains(event.additional_information, #text(keyword))) {
              results_events := Array.append<Event>([event], results_events);
          }
      };
      results_events
    };

    // public func findByDistance(start_lat: Float, start_long: Float, distance: Int): async [Event] {
    //   var results_events: [Event] = [];
    //   for (event in events.vals()) {
    //       let dist  = calcCrow(start_lat, start_long, event.lat, event.long);
    //       if(Float.lessOrEqual(dist,distance)) {
    //           results_events := Array.append<Event>([event], results_events);
    //       }
    //   };
    //   results_events
    // };


    //This function takes in latitude and longitude of two location and returns the distance between them as the crow flies (in km)
    public func calcCrow(lat1: Float, lon1: Float, lat2: Float, lon2: Float) : async () {
      // var R: Float = 6371; // km
      // var dLat = toRad((lat2-lat1));
      // var dLon = toRad(lon2-lon1);
      // var lat1 = toRad(lat1);
      // var lat2 = toRad(lat2);

      // var a = Float.mul(Float.sin(Float.div(dLat,2)),Float.sin(Float.div(dLat,2))) +
      //   Float.sin(Float.div(dLon,2)) * Float.sin(Float.div(dLon,2)) * Float.cos(lat1) * Float.cos(lat2); 
      // var c = Float.mul(2, Float.arctan2(Float.sqrt(a), Float.sqrt(1-a))); 
      // var d = Float.mul(R,c);
      // return d;
    };

    // Converts numeric degrees to radians
    public func toRad(val: Float) : async Float {
        return Float.div(Float.mul(val,Float.pi),180);
    };

    public func greet(name : Text) : async Text {
        return "Hello, " # name # "!";
    };
};
