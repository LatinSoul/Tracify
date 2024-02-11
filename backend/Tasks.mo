import Time "mo:base/Time";

actor class Task(name: Text, desc: Text){

  var id: Int = 0;
  var timeStamp: Int = Time.now(); // maybe it should be init to 0, and assigned Time.now() when the task is instanciated?
  var name: Text = "";
  var desc: Text = "";
  var status: Text ="";

  private func incrementId() { id += 1 };
  private func setTimeStamp() { timeStamp := Time.now() };
  public shared func getId(): async Int { id };
  public shared func getTimeStamp(): async Int { timeStamp };
  public shared func getName(): async Text { name };
  public shared func getDescription(): async Text { desc };
  public shared func getStatus(): async Text { status };

};
