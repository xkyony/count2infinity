import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/services/auth/repo.dart';

import 'utils.dart';

/// Usage: I fail to login with {'mrbean@hari.co'} email and {'Qu1rkY'} password
Future<void> iFailToLoginWithEmailAndPassword(
  WidgetTester tester,
  String email,
  String password,
) async {
  final ref = tester.container;
  final authRepo = ref.read(authRepoProvider);
  await authRepo.signInWithEmailAndPassword(
    email,
    password,
  );
  await tester.pumpAndSettle();
}
