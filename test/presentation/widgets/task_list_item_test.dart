import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/domain/entity/task.dart';
import 'package:task_manager/presentation/widgets/task_list_item_widget.dart';

void listItemTests() {
  group('TaskItem', () {
    late Task task;
    late Function() onPressed;
    late Widget testWidget;

    setUp(() {
      // Create a sample task and onPressed callback
      task = Task(description: 'Sample Task');
      onPressed = () {}; // Mock onPressed function

      // Create the test widget
      testWidget = MaterialApp(
        home: Scaffold(
          body: TaskItem(task: task, onPressed: onPressed),
        ),
      );
    });

    testWidgets('Displays task description', (WidgetTester tester) async {
      // Build the widget and trigger frame rendering
      await tester.pumpWidget(testWidget);

      // Verify that the task description is displayed
      expect(find.text('Sample Task'), findsOneWidget);
    });

    testWidgets('Triggers onPressed callback when delete button is pressed',
        (WidgetTester tester) async {
      // Variable to track whether onPressed is called
      var onPressedCalled = false;

      // Update the onPressed callback to set onPressedCalled to true
      onPressed = () {
        onPressedCalled = true;
      };

      // Create the updated test widget with the new onPressed callback
      testWidget = MaterialApp(
        home: Scaffold(
          body: TaskItem(task: task, onPressed: onPressed),
        ),
      );

      // Build the widget and trigger frame rendering
      await tester.pumpWidget(testWidget);

      // Tap the delete button
      await tester.tap(find.byIcon(Icons.delete));

      // Verify that the onPressed callback is called
      expect(onPressedCalled, isTrue);
    });
  });
}
