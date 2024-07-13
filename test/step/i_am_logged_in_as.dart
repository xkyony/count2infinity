import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/services/auth/repo.dart';
import 'package:pharmacy/services/environment/provider.dart';

import 'utils.dart';

/// Usage: I am logged in as
Future<void> iAmLoggedInAs(WidgetTester tester, String username) async {
  final ref = tester.container;
  final user = ref.read(authRepoProvider).currentUser;
  expect(user, isNotNull);
  expect(user?.name, username);
}
