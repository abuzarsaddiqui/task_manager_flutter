// bloc/tasks/tasks_bloc.dart

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:task_manager/domain/usecase/add_task_usecase.dart';
import 'package:task_manager/domain/usecase/delete_task_usecase.dart';
import 'package:task_manager/domain/usecase/list_tasks_usecase.dart';
import 'package:task_manager/presentation/bloc/task/task_event.dart';
import 'package:task_manager/presentation/bloc/task/task_state.dart';

import '../../../domain/entity/task.dart';



class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final ListTaskUseCase listTasksUseCase;
  final AddTaskUseCase addTaskUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;


  TasksBloc({
    required this.listTasksUseCase,
    required this.addTaskUseCase,
    required this.deleteTaskUseCase,
  }) : super(TasksEmpty()){
    on<AddTask>((event, emit)=>_onAddTask(event.description, emit));
    on<LoadTasks>((event, emit)=>_onLoadTasks(emit));
    on<DeleteTask>((event, emit)=>_onDeleteTask(event.task, emit));
  }

  Future<void> _onLoadTasks(Emitter<TasksState> emit) async {
    try {
      final tasks = await listTasksUseCase.listTasks();
      emit(TasksLoaded(tasks));
    } catch (error) {
      print(error);
    }
  }

  void _onAddTask(String description, Emitter<TasksState> emit) async {
    if (description.isEmpty) return;

    try {
      await addTaskUseCase.addTask(description);
      await _onLoadTasks(emit); // Reload tasks after adding
      // final tasks = await listTasksUseCase.listTasks();
    } catch (error) {
      //handle exception
      print(error);

    }
  }

  void _onDeleteTask(Task task, Emitter<TasksState> emit) async {
    try {
      await deleteTaskUseCase.deleteTask(task);
      await _onLoadTasks(emit); // Reload tasks after adding
    } catch (error) {
      //handle exception
      print(error);

    }
  }
}
