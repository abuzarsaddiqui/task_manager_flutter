import '../../../domain/entity/task.dart';

abstract class TasksState {}

class TasksEmpty extends TasksState{}
class TasksLoaded extends TasksState {
  final List<Task> tasks;

  TasksLoaded(this.tasks);
}

