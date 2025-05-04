import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healer/main.dart'; // ✅ Make sure this is the correct package name

void main() {
  testWidgets('Splash screen appears', (WidgetTester tester) async {
    await tester.pumpWidget(const HealerApp());

    expect(find.text('Welcome to Healer'), findsOneWidget);
    expect(find.text('Your Health Companion'), findsOneWidget);
  });
}
