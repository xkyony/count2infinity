import 'package:freezed_annotation/freezed_annotation.dart';
import '../model.dart';

part 'model.g.dart';
part 'model.freezed.dart';

@freezed
class User with _$User, Model {
  const User._();
  const factory User({
    required String id,
    @Default('') String displayName,
    @Default('') String email,
    @Default('') String phoneNumber,
    @Default('') String photoURL,
    @Default(true) bool isAnonymous,
    @Default(false) bool isEmailVerified,
  }) = _User;

  static String get collection => 'user';

  bool get isGhost => id == '';

  @override
  String toString() {
    return 'User id:$id, email: $email)';
  }

  String get name {
    return displayName.isEmpty ? email : displayName;
  }

  String get initials {
    List<String> parts = displayName.split(" ");
    return parts.fold(
        "", (result, part) => result + part.substring(0, 1).toUpperCase());
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
