import TaskModule "ic:TaskModule";

// Initialization logic
public func init() : async () {
  // Perform any initialization tasks here, if needed
}

// Entry point : create a new task
public func createTask(name : Text, description : Text, status : Text, timestamp : Time) : async Text {
  let taskActor = await TaskModule.createTask(name, description, status, timestamp);
  return taskActor.id;
}

// Entry point: Retrieve a task by ID
public func getTaskById(taskId : Text) : async ?TaskActor {
  return await TaskModule.getTaskById(taskId);
}

// Entry point: Update a task's name
public func updateTaskName(taskId : Text, newName : Text) : async () {
  await TaskModule.updateTaskName(taskId, newName);
}

// Entry point: Delete a task by ID
public func deleteTask(taskId : Text) : async () {
  await TaskModule.deleteTask(taskId);
}