import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see the max value {'7'}
Future<void> iSeeTheMaxValue(WidgetTester tester, String param1) async {
  final maxValueFinder = find.byKey(const Key('counter_max'));
  // Ensure the text contains the expected max value
  final maxValueText = tester.widget<Text>(maxValueFinder).data;
  expect(maxValueText, contains(param1));
}
