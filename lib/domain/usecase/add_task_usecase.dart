import '../entity/task.dart';
import '../repository/task_repository.dart';

class AddTaskUseCase {
  final TaskRepository _repository;

  AddTaskUseCase(this._repository);

  Future<void> addTask(Task task) {
    return _repository.addTask(task);
  }
}