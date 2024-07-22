import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I fill in login email with {'Mr.Bean'}
Future<void> iFillInLoginEmailWith(WidgetTester tester, String email) async {
  await tester.pumpAndSettle();
  final emailField = find.byType(TextFormField).first;
  await tester.enterText(emailField, email);
}
