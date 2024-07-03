import 'package:flutter_test/flutter_test.dart';
import 'package:bdd_widget_test/step/i_tap_text.dart';

/// Usage: I tap {'Current Counter'}
Future<void> iTap(WidgetTester tester, String text) async {
  await iTapText(tester, text);
  await tester.pumpAndSettle();
}
