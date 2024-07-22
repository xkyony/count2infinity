import 'package:flutter_test/flutter_test.dart';

/// Usage: I go back
Future<void> iGoBack(WidgetTester tester) async {
  await tester.pageBack();
  await tester.pumpAndSettle();
}
