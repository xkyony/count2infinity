import 'package:flutter_test/flutter_test.dart';

/// Usage: clean up
Future<void> cleanUp(WidgetTester tester) async {
  await tester.pumpAndSettle();
}
