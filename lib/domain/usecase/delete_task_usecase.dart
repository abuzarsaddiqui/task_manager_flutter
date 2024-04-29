import '../entity/task.dart';
import '../repository/task_repository.dart';

class DeleteTaskUseCase {
  final TaskRepository _repository;

  DeleteTaskUseCase(this._repository);

  Future<void> deleteTask(Task task) {
    return _repository.deleteTask(task);
  }
}