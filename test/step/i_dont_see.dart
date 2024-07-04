import 'package:bdd_widget_test/step/i_dont_see_text.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I don't see
Future<void> iDontSee(WidgetTester tester, String text) async {
  await iDontSeeText(tester, text);
  await tester.pumpAndSettle();
}
