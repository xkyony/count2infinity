import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I double tap {'Current Counter'}
Future<void> iDoubleTap(WidgetTester tester, String param1) async {
  await tester.tap(find.text(param1));
  await tester.pump(kDoubleTapMinTime);
  await tester.tap(find.text(param1));
  await tester.pumpAndSettle();
}
