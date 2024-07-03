import 'package:flutter_test/flutter_test.dart';
import 'package:bdd_widget_test/step/i_enter_into_input_field.dart';

/// Usage: I enter {'New Counter'} text into {0} input field
Future<void> iEnterTextIntoInputFieldxx(
    WidgetTester tester, String param1, num param2) async {
  await iEnterTextIntoInputField(tester, param1, param2);
}
