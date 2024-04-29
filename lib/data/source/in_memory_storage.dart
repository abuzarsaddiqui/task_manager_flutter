import '../../domain/entity/task.dart';

// A simple in-memory storage for tasks
class MemoryStorage {
  // Static list to hold tasks
  static final List<Task> tasks = [];

  // Method to get all tasks
  List<Task> getAllTasks() {
    return tasks;
  }

  // Method to get the index of a specific task
  int getIndexOfTask(Task task) {
    return tasks.indexOf(task);
  }

  // Method to remove a task at a specific index
  void removeTaskAt(int index) {
    tasks.removeAt(index);
  }

  // Method to add a task to the storage
  void addTask(Task task) {
    tasks.add(task);
  }
}
