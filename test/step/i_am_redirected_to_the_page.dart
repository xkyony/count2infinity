import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/router.dart';

import 'utils.dart';

/// Usage: I am redirected to the {'/counters'} page
Future<void> iAmRedirectedToThePage(WidgetTester tester, String route) async {
  await tester.pumpAndSettle();
  final ref = tester.container;
  final router = ref.read(routerProvider);

  final currentRoute = router.routerDelegate.currentConfiguration.fullPath;
  expect(currentRoute, route);
}
