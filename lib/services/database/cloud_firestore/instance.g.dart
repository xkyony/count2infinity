// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instance.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseAppHash() => r'f3f516b3ed299bca517e7d6f71e8d42d96691988';

/// See also [firebaseApp].
@ProviderFor(firebaseApp)
final firebaseAppProvider = AutoDisposeFutureProvider<FirebaseApp>.internal(
  firebaseApp,
  name: r'firebaseAppProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firebaseAppHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAppRef = AutoDisposeFutureProviderRef<FirebaseApp>;
String _$firebaseFirestoreHash() => r'59880dc3b48bd47d09d68ebda2310d3eee5ba3bb';

/// See also [firebaseFirestore].
@ProviderFor(firebaseFirestore)
final firebaseFirestoreProvider = Provider<FirebaseFirestore>.internal(
  firebaseFirestore,
  name: r'firebaseFirestoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseFirestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseFirestoreRef = ProviderRef<FirebaseFirestore>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
