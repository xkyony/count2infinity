// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentCounterHash() => r'db794ad91367c4f9608a4d5007c23c11b7e6ef78';

/// See also [currentCounter].
@ProviderFor(currentCounter)
final currentCounterProvider = AutoDisposeStreamProvider<Counter?>.internal(
  currentCounter,
  name: r'currentCounterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentCounterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentCounterRef = AutoDisposeStreamProviderRef<Counter?>;
String _$counterControllerHash() => r'00fccf558d64ab161fd37f1a76eaae420423d38d';

/// See also [CounterController].
@ProviderFor(CounterController)
final counterControllerProvider =
    AutoDisposeAsyncNotifierProvider<CounterController, Counter>.internal(
  CounterController.new,
  name: r'counterControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$counterControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CounterController = AutoDisposeAsyncNotifier<Counter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
