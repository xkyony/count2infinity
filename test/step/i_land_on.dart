import 'package:flutter_test/flutter_test.dart';

/// Usage: I land on {CounterNewPage}
Future<void> iLandOn(WidgetTester tester, dynamic param1) async {
  expect(find.byType(param1), findsOneWidget);
}
