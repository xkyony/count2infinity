// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$counterHash() => r'081ea9e7f767de6a103aa722be1b8c1ea93997b3';

/// See also [counter].
@ProviderFor(counter)
final counterProvider = AutoDisposeFutureProvider<Counter>.internal(
  counter,
  name: r'counterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$counterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CounterRef = AutoDisposeFutureProviderRef<Counter>;
String _$counterControllerHash() => r'8bca82d6f905b3b310e69ec60a8e007642f71a9f';

/// See also [CounterController].
@ProviderFor(CounterController)
final counterControllerProvider =
    AutoDisposeNotifierProvider<CounterController, Counter>.internal(
  CounterController.new,
  name: r'counterControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$counterControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CounterController = AutoDisposeNotifier<Counter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
