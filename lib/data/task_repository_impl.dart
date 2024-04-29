import 'package:task_manager/data/source/in_memory_storage.dart';
import 'package:task_manager/domain/entity/task.dart';
import 'package:task_manager/domain/repository/task_repository.dart';

// Implementation of TaskRepository interface using in-memory storage
class TaskRepositoryImpl implements TaskRepository {
  final MemoryStorage _storage =
      MemoryStorage(); // Creating an instance of MemoryStorage

  // Method to add a task to the repository
  @override
  Future<void> addTask(Task task) {
    // Adding the task to the in-memory storage
    _storage.addTask(task);
    // Returning a completed Future
    return Future.value();
  }

  // Method to delete a task from the repository
  @override
  Future<void> deleteTask(Task task) {
    // Finding the index of the task and removing it from the in-memory storage
    _storage.removeTaskAt(_storage.getIndexOfTask(task));
    // Returning a completed Future
    return Future.value();
  }

  // Method to retrieve all tasks from the repository
  @override
  Future<List<Task>> getAllTasks() {
    // Returning a Future containing the list of tasks from the in-memory storage
    return Future.value(_storage.getAllTasks());
  }
}
