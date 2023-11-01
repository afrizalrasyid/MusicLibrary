import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_library/view/feedback_screen.dart';

void main() {
  testWidgets('Testing Title: Feedback', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: FeedBack(),
      ),
    );

    expect(find.text('Feedback'), findsOneWidget);
  });
}
