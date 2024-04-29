import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/data/task_repository_impl.dart';
import 'package:task_manager/domain/entity/task.dart';
import 'package:task_manager/domain/usecase/add_task_usecase.dart';
import 'package:task_manager/domain/usecase/delete_task_usecase.dart';



void useCasesTests() {
  group('TaskUseCase', () {
    late AddTaskUseCase addTaskUseCase;
    late TaskRepositoryImpl repository;
    late DeleteTaskUseCase deleteTaskUseCase;

    setUp(() {
      repository = TaskRepositoryImpl();
      addTaskUseCase = AddTaskUseCase(repository);
      deleteTaskUseCase = DeleteTaskUseCase(repository);
    });

    test('addTask test', () async {
      // Arrange
      const description = 'Test task';

      // Act
      await addTaskUseCase.addTask(description);

      // Assert
      List<Task> tasks = await repository.getAllTasks();
      expect(tasks.any((element) => element.description == description), true);
    });

    test('deleteTask test', () async {
      // Arrange
      const description = 'delete task';
      await addTaskUseCase.addTask(description);
      List<Task> tasks = await repository.getAllTasks();
      var task = tasks.firstWhere((element) => element.description == description);

      // Act

      await deleteTaskUseCase.deleteTask(task);

      // Assert
      List<Task> items = await repository.getAllTasks();
      expect(items.any((element) => element.description == description), false);
    });

    test('listTask test', () async {
      // Assert
      List<Task> items = await repository.getAllTasks();
      expect(items.length, 3);
    });
  });
}
