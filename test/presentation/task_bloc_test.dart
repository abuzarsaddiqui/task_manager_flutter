import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager/data/task_repository_impl.dart';
import 'package:task_manager/domain/entity/task.dart';
import 'package:task_manager/domain/usecase/add_task_usecase.dart';
import 'package:task_manager/domain/usecase/delete_task_usecase.dart';
import 'package:task_manager/domain/usecase/list_tasks_usecase.dart';
import 'package:task_manager/presentation/bloc/task/task_bloc.dart';
import 'package:task_manager/presentation/bloc/task/task_event.dart';
import 'package:task_manager/presentation/bloc/task/task_state.dart';

void blocTests() {
  group('TasksBloc', () {
    late ListTaskUseCase listTaskUseCase;
    late AddTaskUseCase addTaskUseCase;
    late DeleteTaskUseCase deleteTaskUseCase;
    late TasksBloc bloc;
    late TaskRepositoryImpl repository;
    setUp(() {
      repository = TaskRepositoryImpl();
      listTaskUseCase = ListTaskUseCase(repository);
      addTaskUseCase = AddTaskUseCase(repository);
      deleteTaskUseCase = DeleteTaskUseCase(repository);
      bloc = TasksBloc(
        listTasksUseCase: listTaskUseCase,
        addTaskUseCase: addTaskUseCase,
        deleteTaskUseCase: deleteTaskUseCase,
      );
    });

    test('LoadTasks event emits TasksLoaded state', () async {
      // Arrange
      const description = 'New Task';

      // Act
      bloc.add(AddTask(description));

      // Act
      bloc.add(LoadTasks());

      // Assert
      await expectLater(
        bloc.stream,
        emitsThrough(isA<TasksState>().having(
              (state) => state.runtimeType,
          'type',
          TasksLoaded,
        )),      );
    });

    test('AddTask event emits TasksLoaded state after adding task', () async {
      // Arrange
      const description = 'New Task';

      // Act
      bloc.add(AddTask(description));

      // Assert
      await expectLater(
        bloc.stream,
        emitsThrough(isA<TasksState>().having(
              (state) => state.runtimeType,
          'type',
          TasksLoaded,
        )),      );
    });

    test('DeleteTask event emits TasksLoaded state after deleting task', () async {
      // Arrange
      const description = 'New Task';
      bloc.add(AddTask(description));
      var tasks = await repository.getAllTasks();
      // Act
      bloc.add(DeleteTask(tasks.last));

      // Assert
      await expectLater(
        bloc.stream,
        emitsThrough(isA<TasksState>().having(
              (state) => state.runtimeType,
          'type',
          TasksLoaded,
        )),      );
    });
  });
}
