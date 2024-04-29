import 'package:flutter/material.dart';
import 'package:task_manager/domain/entity/task.dart';

class TaskItem extends StatelessWidget{
  final Task task;
  final Function() onPressed;

  const TaskItem({super.key, required this.task, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.description),
      trailing: IconButton(icon: const Icon(Icons.delete), onPressed: onPressed,)
      // Implement delete functionality
    );
  }

}