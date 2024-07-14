import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/services/auth/repo.dart';

import 'utils.dart';

/// Usage: I am not logged in
Future<void> iAmNotLoggedIn(WidgetTester tester) async {
  final ref = tester.container;
  final authRepo = ref.read(authRepoProvider);
  await authRepo.signOut();
  final user = authRepo.currentUser;
  expect(user, isNull);
}
