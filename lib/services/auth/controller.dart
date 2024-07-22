import 'package:pharmacy/services/auth/repo.dart';
import 'package:pharmacy/services/user/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller.g.dart';

@riverpod
Stream<User?> userStream(UserStreamRef ref) {
  return ref.watch(authRepoProvider).userStream;
}
