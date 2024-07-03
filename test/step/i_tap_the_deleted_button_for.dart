import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/features/counter/repository.dart';

import 'utils.dart';

/// Usage:  I tap the deleted button for {'To be deleted counter'}
Future<void> iTapTheDeletedButtonFor(
    WidgetTester tester, String counterName) async {
  final ref = tester.container;
  final counters = await ref
      .read(counterRepoProvider)
      .fetchBy(field: 'name', value: counterName);
  if (counters.isEmpty) {
    print('Counter #{counterName} not found.');
    return;
  }
  final counter = counters.first;

  final deleteButtonFinder = find.byKey(Key('delete_button_${counter.id}'));
  expect(deleteButtonFinder, findsOneWidget);
  await tester.tap(deleteButtonFinder);
  await tester.pumpAndSettle();
}
