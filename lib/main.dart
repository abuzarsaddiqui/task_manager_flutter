import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/data/task_repository_impl.dart';
import 'package:task_manager/presentation/bloc/task/task_bloc.dart';
import 'package:task_manager/presentation/screens/list_task.dart';

import 'domain/usecase/add_task_usecase.dart';
import 'domain/usecase/delete_task_usecase.dart';
import 'domain/usecase/list_tasks_usecase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TasksBloc>(
      create: (context) => TasksBloc(
          listTasksUseCase: ListTaskUseCase(TaskRepositoryImpl()),
          addTaskUseCase: AddTaskUseCase(TaskRepositoryImpl()),
          deleteTaskUseCase: DeleteTaskUseCase(TaskRepositoryImpl()),
        ),
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ListTaskScreen()
        ),
    );
  }
}


