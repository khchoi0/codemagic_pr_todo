import 'package:codemagic_pr_todo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that we have correct tasks initially
    expect(find.text('TODO today'), findsOneWidget);
    expect(find.text('4. A new task'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that we have added a task
    expect(find.text('4. A new task'), findsOneWidget);
  });
}
