import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap the {'Add Counter'} button
Future<void> iTapTheButton(
  WidgetTester tester,
  String label,
) async {
  await tester.tap(find.byKey(Key(label)));
  await tester.pumpAndSettle();
}
