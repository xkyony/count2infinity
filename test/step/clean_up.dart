import 'package:flutter_test/flutter_test.dart';

/// Usage: clean up
Future<void> cleanUp(WidgetTester tester) async {
  try {
    for (int i = 0; i < 5; i++) {
      await tester.pump(Duration(seconds: 1));
    }
  } catch (e) {
    print('xxxx Warning: pumpAndSettle timeout during cleanup.');
  }
}
