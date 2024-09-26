import 'dart:io';

class Task {
  int id;
  String description;
  bool completed;
  Task(this.id, this.description) : completed = false;
  void displayTask() {
    print('-----------------------------------------');
    print('Task ID : $id');
    print('Task : $description');
    print('status :  ${completed ? 'completed' : 'Not completed'}');
  }

  void taskCompleted() {
    this.completed = true;
  }
}

class TaskList {
  var tasks = <Task>[];
  int nextId = 1;

  void addTask() {
    print('Enter the task: ');
    String? input = stdin.readLineSync();

    if (input != null && input.isNotEmpty) {
      Task newTask = Task(nextId, input);
      this.tasks.add(newTask);
      nextId++;
    } else {
      print('Invalid task description.');
    }
  }

  void displayList() {
    if (tasks.isEmpty) {
      print('No tasks available.');
    } else {
      tasks.forEach((task) {
        task.displayTask();
      });
    }
  }

  void removeTask() {
    print('Enter the ID of the task to remove: ');
    String? input = stdin.readLineSync();
    if (input != null && int.tryParse(input) != null) {
      int taskId = int.parse(input);
      tasks.removeWhere((task) => task.id == taskId);
      print('Task with ID $taskId removed.');
    } else {
      print('Invalid ID.');
    }
  }

  void completeTask() {
    bool flag = false;
    print('Enter the ID of the task ypu want to mark as complete: ');
    String? input = stdin.readLineSync();
    if (input != null && int.tryParse(input) != null) {
      int taskId = int.parse(input);
      for (Task task in this.tasks) {
        if (task.id == taskId) {
          task.taskCompleted();
          flag = true;
          break;
        }
      }
      if (flag) {
        print('Task with ID $taskId mark as completed.');
      } else {
        print('invalid ID.');
      }
    } else {
      print('Invalid ID.');
    }
  }
}

void main() {
  TaskList taskList = TaskList();
  bool running = true;

  while (running) {
    print('\n1. Add a task');
    print('2. View tasks');
    print('3. Remove a task');
    print('4. Mark task as completed');
    print('5. Exit');
    stdout.write('Choose an option: ');

    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        taskList.addTask();
        break;
      case '2':
        taskList.displayList();
        break;
      case '3':
        taskList.removeTask();
        break;
      case '4':
        taskList.completeTask();
        break;
      case '5':
        print('Exiting...');
        running = false;
        break;
      default:
        print('Invalid option. Please choose a valid option.');
    }
  }
}
