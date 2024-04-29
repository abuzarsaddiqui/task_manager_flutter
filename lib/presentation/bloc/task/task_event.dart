import '../../../domain/entity/task.dart';

abstract class TasksEvent {}

class LoadTasks extends TasksEvent {}

class AddTask extends TasksEvent {
  final String description;
  AddTask(this.description);
}

class DeleteTask extends TasksEvent {
  final Task task;

  DeleteTask(this.task);
}