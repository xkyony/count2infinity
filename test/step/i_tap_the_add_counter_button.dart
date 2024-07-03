import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap the Add Counter button
Future<void> iTapTheAddCounterButton(WidgetTester tester) async {
  const key = Key('counter_add_button');
  await tester.tap(find.byKey(key));
  await tester.pumpAndSettle();
}

