interface GetTodoResponse {
  tasks: Task[];
}

interface NewTodoResponse {
  result: "sucess" | "failure";
  message?: string;
  task?: Task;
}

interface DoneTodoResponse {
  result: "sucess" | "failure";
  message?: string;
  task?: Task;
}

interface Task {
  id: number;
  created_at: Date;
  updated_at: Date;
  title: string;
  done: boolean;
  done_at?: Date;
}

const taskInput = document.getElementById("task-input") as HTMLInputElement;
const addTaskButton = document.getElementById("add-task-button") as HTMLButtonElement;
const taskList = document.getElementById("task-list") as HTMLUListElement;

const addTask = async () : Promise<Task | undefined> => {

  const taskName = taskInput.value.trim();
  if (!taskName) {
    return undefined;
  }

  const task: any = {
    name: taskName
  };

  try {
    const response = await fetch("/api/todo", {
      method: "POST",
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(task),
    });

    if (!response.ok) {
      throw new Error('response not ok' + response.status);
    }

    const responseData: NewTodoResponse = await response.json();

    return responseData.task;
  } catch (error) {
    console.error("Error adding task:", error);

    return undefined;
  }
};


const fetchAllTasks = async () : Promise<Task[]> => {
  try {
    const response = await fetch("/api/todo");

    if (!response.ok) {
      throw new Error('response not ok' + response.status);
    }

    const result = await response.json();
    return result.tasks;
  } catch (error) {
    console.error("Error fetching tasks:", error);
    return [];
  }
}

const renderTasks = (tasks: Task[]) => {
  // id="task-list" を取得
  taskList.innerHTML = "";
  tasks.forEach(task => {
    const tr = document.createElement("tr");
    tr.innerHTML = `
      <td>${task.id}</td>
      <td>${task.title}</td>
      <td>${task.created_at}</td>
      <td>${task.updated_at}</td>
      <td>
      ${task.done ? "done" : `<button class="done-button" data-task-id="${task.id}">Done</button>`}
      </td>
      <td>${task.done_at || ""}</td>
    `;

    // ボタンにイベントリスナーを追加
    if (!task.done) {
      const doneButton = tr.querySelector(".done-button") as HTMLButtonElement;
      if (doneButton) {
      doneButton.addEventListener("click", async () => {
        await doneTask(task.id);
        const tasks = await fetchAllTasks();
        renderTasks(tasks);
      });
      }
    }
    taskList.appendChild(tr);
  });
};

const doneTask = async (taskId: number) : Promise<void> => {
  try {
    const response = await fetch(`/api/todo/${taskId}`, {
      method: "PUT",
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ done: true }),
    });

    if (!response.ok) {
      throw new Error('response not ok' + response.status);
    }
  } catch (error) {
    console.error("Error marking task as done:", error);
  }
}

const init = async () => {
  // タスクの追加ボタンのイベントリスナーを設定
  addTaskButton.addEventListener("click", async () => {
    const newTask = await addTask();
    if (newTask) {
      taskInput.value = "";
      const tasks = await fetchAllTasks();
      renderTasks(tasks);
    }
  });

  // 初期タスクの取得と表示
  const tasks = await fetchAllTasks();
  renderTasks(tasks);
};

document.addEventListener("DOMContentLoaded", init);

