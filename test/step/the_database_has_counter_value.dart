import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/app.dart';
import 'package:pharmacy/features/counter/controller.dart';

/// Usage: the database has counter value {5}
Future<void> theDatabaseHasCounterValue(WidgetTester tester, num value) async {
  final element = tester.element(find.byType(MyApp));
  final container = ProviderScope.containerOf(element);
  // retrieve the counter value in the database
  final counter = await container.read(counterProvider.future);
  expect(counter.value, equals(value));
}
