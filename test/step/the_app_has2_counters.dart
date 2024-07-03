import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/features/counter/model.dart';
import 'package:pharmacy/features/counter/repository.dart';

import 'utils.dart';

/// Usage: the app has 2 counters
Future<void> theAppHas2Counters(WidgetTester tester) async {
  // Initialize the counters
  final ref = tester.container;
  final repo = ref.read(counterRepoProvider);
  await repo.add(Counter.initial());
  await repo.add(Counter.initial().copyWith(id: 'second', name: 'Secunda'));

  await tester.pumpAndSettle();
}
