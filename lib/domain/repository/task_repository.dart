import 'package:task_manager/domain/entity/task.dart';

abstract class TaskRepository{
  Future<List<Task>> getAllTasks();
  Future<void> addTask(Task task);
  Future<void> deleteTask(Task task);
}