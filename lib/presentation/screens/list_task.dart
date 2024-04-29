import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/presentation/bloc/task/task_event.dart';
import 'package:task_manager/presentation/screens/add_task_screen.dart';

import '../bloc/task/task_bloc.dart';
import '../bloc/task/task_state.dart';
import '../widgets/task_list_item_widget.dart';

class ListTaskScreen extends StatelessWidget {
  const ListTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tasks"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddTaskScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) {
            if (state is TasksLoaded) {
              return ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  final task = state.tasks[index];
                  return TaskItem(
                      task: task,
                      onPressed: () {
                        BlocProvider.of<TasksBloc>(context)
                            .add(DeleteTask(task));
                      });
                },
              );
            } else {
              return const Center(child: Text('Click + to create tasks'));
            }
          },
        ));
  }
}
