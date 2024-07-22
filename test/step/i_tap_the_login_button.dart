import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap the login button
Future<void> iTapTheLoginButton(WidgetTester tester) async {
  final signInTexts = find.text('Sign in');
  await tester.tap(signInTexts.last);
}
