import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/data/task_repository_impl.dart';
import 'package:task_manager/domain/usecase/add_task_usecase.dart';
import 'package:task_manager/domain/usecase/delete_task_usecase.dart';
import 'package:task_manager/domain/usecase/list_tasks_usecase.dart';
import 'package:task_manager/presentation/bloc/task/task_bloc.dart';

import 'package:task_manager/presentation/screens/list_task.dart';

// Create a mock TasksBloc

void listScreenTests() {
  group('ListTaskScreen', () {
    late TasksBloc tasksBloc;

    setUp(() {
      tasksBloc = TasksBloc(
        listTasksUseCase: ListTaskUseCase(TaskRepositoryImpl()),
        addTaskUseCase: AddTaskUseCase(TaskRepositoryImpl()),
        deleteTaskUseCase: DeleteTaskUseCase(TaskRepositoryImpl()),
      );
    });

    testWidgets('Renders TasksEmpty state correctly',
        (WidgetTester tester) async {
      // Build the ListTaskScreen widget with the mocked TasksBloc
      await tester.pumpWidget(BlocProvider<TasksBloc>(
        create: (context) => tasksBloc,
        child: MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: tasksBloc,
              child: const ListTaskScreen(),
            ),
          ),
        ),
      ));
      // mockTasksBloc.add(AddTask("Task 1"));
      // mockTasksBloc.add(AddTask("Task 2"));

      // Verify that the TasksLoaded state is rendered correctly
      expect(find.text('Tasks'), findsOneWidget);
      expect(find.text('Click + to create tasks'), findsOneWidget);
    });
  });
}
