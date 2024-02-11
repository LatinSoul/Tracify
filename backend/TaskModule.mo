module {
  import TaskActor "ic:TaskActor";

  public func createTask(name : Text, description : Text, status : Text) : async TaskActor {
    let taskActor = await TaskActor(name, description, status);
    return taskActor;
  }

  public query func getTaskName(task : TaskActor) : async Text {
    return task.name;
  }

  // Other CRUD functions...
};
