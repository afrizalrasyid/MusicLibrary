import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_library/view/welcome_screen.dart';

void main() {
  testWidgets('Testing Text: Welcome to', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Welcome(),
      ),
    );

    expect(find.text('Welcome to'), findsOneWidget);
  });

  testWidgets('Testing Text: Music Library', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Welcome(),
      ),
    );

    expect(find.text('Music Library'), findsOneWidget);
  });

  testWidgets('Testing Button Submit', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Welcome(),
      ),
    );

    expect(find.widgetWithText(ElevatedButton, 'Get Started'), findsOneWidget);
  });
}
