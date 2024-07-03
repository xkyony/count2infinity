import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

/// Usage: I fill in {'Initial Value'} with  {'100'}
Future<void> iFillInWith(WidgetTester tester, String label, String text) async {
  final textField = find.byKey(Key(label));
  await tester.enterText(textField, text);
  await tester.pumpAndSettle();
}
