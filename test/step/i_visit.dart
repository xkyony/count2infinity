import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/router.dart';

import 'utils.dart';

/// Usage: I visit {'/counters/'}
Future<void> iVisit(WidgetTester tester, String path) async {
  final ref = tester.container;
  final router = ref.read(routerProvider);
  router.go(path);
  await tester.pumpAndSettle();
}
