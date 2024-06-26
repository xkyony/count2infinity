import 'package:flutter_test/flutter_test.dart';

/// Usage: I spot {'2024-03-05 13:30'} as part of a paragraph
Future<void> iSpot(WidgetTester tester, String pattern) async {
  expect(find.textContaining(pattern), findsOneWidget);
}
