import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/features/counter/repository.dart';

import 'utils.dart';

/// Usage: I tap the edit button for {'Current Counter'}
Future<void> iTapTheEditButtonFor(WidgetTester tester, String counterName) async {
  final ref = tester.container;
  final counters = await ref
      .read(counterRepoProvider)
      .fetchBy(field: 'name', value: counterName);
  if (counters.isEmpty) {
    print('Counter #{counterName} not found.');
    return;
  }
  final counter = counters.first;

  final editButtonFinder = find.byKey(Key('edit_button_${counter.id}'));
  expect(editButtonFinder, findsOneWidget);
  await tester.tap(editButtonFinder);
  await tester.pumpAndSettle();
}
