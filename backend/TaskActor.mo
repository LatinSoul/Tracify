actor class TaskActor {
  var name : Text;
  var description : Text;
  var status : Text;

  public func init(name' : Text, description' : Text, status' : Text) {
    name := name';
    description := description';
    status := status';
  }

  // Methods for CRUD operations
  public func updateName(newName : Text) : async () {
    name := newName;
  }

  // Other CRUD methods...
};
