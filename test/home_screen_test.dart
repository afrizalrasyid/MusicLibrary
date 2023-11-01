import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_library/view/home_screen.dart';

void main() {
  testWidgets('Testing Header Image', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Home(),
      ),
    );

    expect(find.image(AssetImage('assets/images/home/header_home.jpg')),
        findsOneWidget);
  });

  testWidgets('Testing Header Text: Discover Your Music',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Home(),
      ),
    );

    expect(find.text('Discover Your Music'), findsOneWidget);
  });
}
