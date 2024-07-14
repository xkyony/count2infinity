import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../user/model.dart';

part 'repo.g.dart';

@Riverpod(keepAlive: true)
AuthRepo authRepo(AuthRepoRef ref) => throw UnimplementedError();

abstract class AuthRepo {
  Future<User> signUpWithEmailAndPassword(
    String email,
    String password,
  );

  bool get isLoggedIn => currentUser != null;

  Stream<User?> get userStream;
  User? get currentUser;

  Future<void> deleteUser(
    String email,
    String password,
  );

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<void> seed(List<User> users);

  Future<void> signInWithGoogle() async {
    throw UnimplementedError();
  }

  Future<void> signUpWithGoogle() async {
    throw UnimplementedError();
  }

  Future<void> sendPasswordResetEmail(String email) async {}

  Future<void> signInWithFacebook() async {}

  Future<void> signUpWithFacebook() async {}

  Future<void> signInWithTwitter() async {}

  Future<void> signUpWithTwitter() async {}

  Future<void> signInAnonymously() async {}

  Future<void> signOut() async {}
}
