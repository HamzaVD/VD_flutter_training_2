import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todoList/main.dart';

void main() {
  testWidgets('Add Task', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // expect(find.byKey(Key('AddTaskField')), findsOneWidget);
    // expect(find.text('1'), findsOneWidget);
  });
}
