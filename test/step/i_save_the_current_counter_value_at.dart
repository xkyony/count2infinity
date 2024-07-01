import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/features/counter/controller.dart';

import 'i_tap_icon.dart';
import 'utils.dart';

/// Usage: I save the current counter value at {'2024-05-03 13:30'}
/// Note: Trick system to set the time
Future<void> iSaveTheCurrentCounterValueAt(
    WidgetTester tester, String timestamp) async {
  final time = DateTime.parse(timestamp);
  final container = tester.container;
  final countroller = container.read(counterControllerProvider.notifier);
  countroller.saveAt(time);
  await iTapIcon(tester, Icons.save);

  await tester.pumpAndSettle();
}
