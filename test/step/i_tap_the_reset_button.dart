import 'package:flutter_test/flutter_test.dart';
import 'i_tap_icon.dart';
import 'package:flutter/material.dart';

/// Usage: I tap the reset button
Future<void> iTapTheResetButton(WidgetTester tester) async {
  await iTapIcon(tester, Icons.refresh);
  await tester.pumpAndSettle();
}
