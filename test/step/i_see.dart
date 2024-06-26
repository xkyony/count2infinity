import 'package:flutter_test/flutter_test.dart';

/// Usage: I see {'0'}
Future<void> iSee(WidgetTester tester, String text) async {
  expect(find.text(text), findsOneWidget);
}
