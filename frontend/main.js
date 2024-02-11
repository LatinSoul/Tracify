import { actorFactory } from "ic-actor-factory";
import * as TaskModule from "../backend/TaskModule.mo";

async function renderTasks() {
  const taskListElement = document.getElementById("taskList");
  taskListElement.innerHTML = "";

  // Fetch tasks from the backend canister
  const tasks = await TaskModule.getAllTasks();

  // Render tasks in the frontend
  tasks.forEach(task => {
    const taskElement = document.createElement("div");
    taskElement.innerHTML = `
      <h2>${task.name}</h2>
      <p>${task.description}</p>
      <p>Status: ${task.status}</p>
    `;
    taskListElement.appendChild(taskElement);
  });
}

document.addEventListener("DOMContentLoaded", async () => {
  // Render tasks when the page loads
  await renderTasks();
});
