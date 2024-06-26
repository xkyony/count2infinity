import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'i_tap_icon.dart';

/// Usage: I retrieve the saved counter value
Future<void> iRetrieveTheSavedCounterValue(WidgetTester tester) async {
  await tester.runAsync(() async {
    await iTapIcon(tester, Icons.restore);
    await tester.pumpAndSettle();
  });
}
