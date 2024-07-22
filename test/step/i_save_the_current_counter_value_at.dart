import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/features/counter/controller.dart';
import 'package:pharmacy/router.dart';

import 'i_tap_icon.dart';
import 'utils.dart';

/// TODO: How to use a Time provider
/// Usage: I save the current counter value at {'2024-05-03 13:30'}
/// Note: Trick system to set the time
Future<void> iSaveTheCurrentCounterValueAt(
    WidgetTester tester, String timestamp) async {
  final time = DateTime.parse(timestamp);
  final ref = tester.container;
  final countroller = ref.read(counterControllerProvider.notifier);
  final counter = await ref.read(counterProvider('current').future);
  if (counter == null) {
    throw Exception('Counter with id:current not found');
  }
  final newCounter = counter.copyWith(at: time);
  await countroller.saveToLocalDisk(newCounter);
  // await iTapIcon(tester, Icons.save);

  await tester.pumpAndSettle();
}
