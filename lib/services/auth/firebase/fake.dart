import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

class FakeAdditionalUserInfo implements AdditionalUserInfo {
  @override
  final String? providerId;

  @override
  final bool isNewUser;

  FakeAdditionalUserInfo({
    this.providerId,
    this.isNewUser = false,
  });

  @override
  // TODO: implement authorizationCode
  String? get authorizationCode => throw UnimplementedError();

  @override
  Map<String, dynamic>? get profile => null;

  @override
  String? get username => null;
}

class FakeAuthCredential extends AuthCredential {
  @override
  String get providerId => 'password';

  @override
  Map<String, dynamic> asMap() => {
        'providerId': providerId,
      };
}

class FakeFirebaseAuth extends MockFirebaseAuth {
  FakeFirebaseAuth({
    super.signedIn,
    super.mockUser,
    super.signInMethodsForEmail,
  });

  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await super
        .signInWithEmailAndPassword(email: email, password: password);
    return FakeUserCredential(
      user: userCredential.user,
      providerId: 'password',
      isNewUser: false,
    );
  }
}

class FakeUserCredential implements UserCredential {
  @override
  final User? user;

  final String? providerId;

  final bool isNewUser;
  FakeUserCredential({
    this.user,
    this.providerId,
    this.isNewUser = false,
  });

  @override
  AdditionalUserInfo? get additionalUserInfo => FakeAdditionalUserInfo(
        providerId: providerId,
        isNewUser: isNewUser,
      );

  @override
  // TODO: implement credential
  AuthCredential? get credential => throw FakeFirebaseCredential();
}
