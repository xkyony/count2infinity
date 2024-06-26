import 'package:flutter_test/flutter_test.dart';
import 'i_tap_icon.dart';
import 'package:flutter/material.dart';

/// Usage: I save the current counter value
Future<void> iSaveTheCurrentCounterValue(WidgetTester tester) async {
  await tester.runAsync(() async {
    await iTapIcon(tester, Icons.save);
    await tester.pumpAndSettle();
  });
}
