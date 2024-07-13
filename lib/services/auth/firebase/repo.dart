import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/services/auth/firebase/instance.dart';
import 'package:pharmacy/services/cloud_functions/firebase/instance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../failure.dart';
import '../../user/model.dart' as domain;
import '../repo.dart';

part 'repo.g.dart';

@Riverpod(keepAlive: true)
AuthRepo firebaseAuthRepo(FirebaseAuthRepoRef ref) {
  final auth = ref.read(firebaseAuthProvider);
  final functions = ref.read(cloudFunctionsProvider);
  return FirebaseAuthRepo(
    auth: auth,
    functions: functions,
  );
}

class FirebaseAuthRepo extends AuthRepo {
  final FirebaseAuth auth;
  final FirebaseFunctions functions;

  FirebaseAuthRepo({
    required this.auth,
    required this.functions,
  }) : super();

  @override
  Stream<domain.User?> get userStream {
    return auth.authStateChanges().map(_convertFromFirebase);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseException catch (e) {
      throw Failure(e.message);
    }
  }

  // create seed user with specified uid
  Future<void> createSeedUser(domain.User user) async {
    final callable = functions.httpsCallable('createSeedUser');
    try {
      await callable.call(<String, dynamic>{
        'uid': user.id,
        'phoneNumber': user.phoneNumber,
        'email': user.email,
        'displayName': user.displayName,
        'disabled': false,
        'password': 'password123',
        'photoUrl': user.photoURL,
      });
      // final authUser = response.data;
      // debugPrint('$authUser');
    } on FirebaseFunctionsException catch (error) {
      debugPrint('Error Code:${error.code} - ${error.message}');
    } catch (error) {
      // debugPrint('Uncaught error: $error');
      rethrow;
    }
  }

  @override
  Future<void> deleteUser(String email, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      credential.user?.delete();
    } on FirebaseAuthException catch (e) {
      throw Failure(e.message!);
    } catch (e) {
      throw Failure('Unexpected Error $e');
    }
  }

  @override
  Future<void> signInAnonymously() async {
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Failure(e.message!);
    }
  }

  @override
  Future<void> signInWithFacebook() async {
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithGoogle() async {
    throw UnimplementedError();
    // try {
    //   // Trigger the authentication flow
    //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //   // Obtain the auth details from the request
    //   final GoogleSignInAuthentication googleAuth =
    //       await googleUser!.authentication;

    //   // Create a credential
    //   final AuthCredential credential = GoogleAuthProvider.credential(
    //     accessToken: googleAuth.accessToken,
    //     idToken: googleAuth.idToken,
    //   );
    //   return _auth.signInWithCredential(credential).then((_) => right(true));
    // } on FirebaseAuthException catch (e) {
    //   return left(Failure(e.message!));
    // }
  }

  @override
  Future<void> signInWithTwitter() async {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Failure(e.message!);
    }
  }

  @override
  Future<domain.User> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _convertFromFirebase(credential.user)!;
    } on FirebaseAuthException catch (e) {
      return throw Failure(e.message!);
    } catch (e) {
      return throw Failure('Unexpected Error $e');
    }
  }

  domain.User? _convertFromFirebase(User? user) {
    return user == null
        ? null
        : domain.User(
            id: user.uid,
            displayName: user.displayName ?? "",
            email: user.email ?? "",
            isAnonymous: user.isAnonymous,
            isEmailVerified: user.emailVerified,
            photoURL: user.photoURL ?? '',
            phoneNumber: user.phoneNumber ?? '',
          );
  }

  @override
  Future<void> seed(List<domain.User> users) async {
    for (final user in users) {
      await createSeedUser(user);
    }
  }

  @override
  // TODO: implement currentUser
  domain.User? get currentUser {
    return _convertFromFirebase(auth.currentUser);
  }
}

// keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
