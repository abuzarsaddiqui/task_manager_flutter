import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String title;

  Task({required this.title})
  : id = const Uuid().v1()

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Task && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Task{id: $id, title: $title}';
  }
}
