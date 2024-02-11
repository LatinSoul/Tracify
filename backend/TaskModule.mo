module {
  import Array "mo:base/Array";
  import Time "mo:base/Time";

  import TaskActor "ic:TaskActor";

  // Counter for auto-incrementing task IDs
  var taskIdCounter : Nat = 0;

  // Map to store tasks by ID
  var tasks : HashMap<Text, TaskActor> = HashMap<Text, TaskActor>();

  // List of available task statuses
    public let availableStatuses : [Text] = [
      "pending",
      "ongoing",
      "cancelled",
      "completed",
      "failed",
      "disputed",
      "confirmed",
      "accepted",
      "rejected"
    ];

  // Function to generate a new unique task ID
  private func generateTaskId() : Text {
    taskIdCounter += 1;
    return "task_" # Nat.toText(taskIdCounter);
  }

  // Function to create a new task
  public func createTask(name : Text, description : Text, status : Text, timestamp : Time) : async TaskActor {
    // Handle case where invalid status is provided
    if (!Array.contains(availableStatuses, status)) {
      return null;
    }
    let taskId = generateTaskId();
    let taskActor = await TaskActor(taskId, name, description, status, timestamp);
    tasks.put(taskId, taskActor);
    return taskActor;
  }

  // Function to retrieve a task by ID
  public query func getTaskById(taskId : Text) : async ?TaskActor {
    return tasks.get(taskId);
  }

  // Function to update a task's name
  public func updateTaskName(taskId : Text, newName : Text) : async () {
    if let task = await getTaskById(taskId) {
      task.updateName(newName);
      tasks.put(taskId, task);
    } else {
      // Handle case where task with specified ID does not exist
      // For example, raise an error or log a message
    }
  }

  // Function to delete a task by ID
  public func deleteTask(taskId : Text) : async () {
    tasks.remove(taskId);
  }
};
