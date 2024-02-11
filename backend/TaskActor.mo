import Time "mo:base/Time";

actor class TaskActor {
  var id : Text;
  var timestamp : Time;
  var name : Text;
  var desc : Text;
  var status : Text;

  // Init Function
  public func init(id' : Text, timestamp' : Time, name' : Text, desc' : Text, status' : Text) {
    id := id';
    timestamp := timestamp';
    name := name';
    desc := desc';
    status := status';
  };
};
