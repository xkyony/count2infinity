import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/features/counter/repository.dart';

import 'utils.dart';

/// Usage: the database has counter value {5}
/// retrieve the counter value in the database
Future<void> theDatabaseHasCounterValue(WidgetTester tester, num value) async {
  final container = tester.container;
  final counter =
      await container.read(counterRepoProvider).fetchCurrentCounter();
  expect(counter.value, equals(value));
}
