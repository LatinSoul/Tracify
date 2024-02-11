import Array "mo:base/Array";
import Time "mo:base/Time";

actor {

  // Define type Time
  type Time = Time.Time;

  // Define the Task record type
  type Task = {
    id : Nat; // Unique identifier for the task
    timestamp : Time; // Timestamp indicating when the task was created
    desc : Text; // Name or description of the task
    status : Text; // Status of the task (e.g., "Pending", "Completed", "In Progress")
  };

  // Define a function to create a new task
  public func createNewTask(id : Nat, desc : Text) : async Task {
    return {
      id = id;
      timestamp = Time.now();
      desc = desc;
      status = "Pending";
    };
  };

  // Define a function to update a task
  public func updateTask(task : Task, desc : Text) : async Task {
    task{desc = desc};
  }; 

  // Define a function to update the status of a task. Status = ["PENDING","CANCELED","COMPLETED","UPDATED","CONFIRMED"]
  public func updateTaskStatus(task : Task, newStatus : Text) : async Task {
    task{status = newStatus};
  };  

  // Define a function to display task details
  public func displayTaskDetails(task : Task) : async () {
    println("Task ID:", Nat.toText(task.id));
    println("Timestamp:", Time.toText(task.timestamp));
    println("Name:", task.name);
    println("Status:", task.status);
  };

  // Create a new task and display its details
  public func main() : async () {
    let task = await newTask(1, "Task name");
    await displayTaskDetails(task);
  };
  
};
