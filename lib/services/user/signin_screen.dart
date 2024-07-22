import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:pharmacy/services/auth/repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../auth/firebase/instance.dart';

class UserSignInScreen extends ConsumerWidget {
  final String redirect;

  const UserSignInScreen({super.key, required this.redirect});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final authRepo = ref.read(authRepoProvider);

    return Scaffold(
      body: SignInScreen(
        auth: ref.read(firebaseAuthProvider),
        providers: [
          EmailAuthProvider(),
          // Add other providers if needed
        ],
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            context.go(redirect);
          }),
          AuthStateChangeAction<AuthFailed>((context, state) {
            // Handle sign in failure, if needed
            print('Login failed with redirect $redirect');
          }),
        ],
      ),
    );
  }
}
