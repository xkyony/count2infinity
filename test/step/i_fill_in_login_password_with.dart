import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

/// Usage: I fill in login password with {'Qu1rkY!'}
Future<void> iFillInLoginPasswordWith(
    WidgetTester tester, String password) async {
  final passwordField = find.byType(TextFormField).at(1);
  await tester.enterText(passwordField, password);
  await tester.pumpAndSettle();
}
