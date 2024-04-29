import '../entity/task.dart';
import '../repository/task_repository.dart';

class ListTaskUseCase {
  final TaskRepository _repository;

  ListTaskUseCase(this._repository);

  Future<List<Task>> listTasks() {
    return _repository.getAllTasks();
  }
}