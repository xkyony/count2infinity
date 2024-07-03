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
String _$counterListHash() => r'69f27115dfd2830ca59585bcdf6cbf974f7110fe';

/// See also [counterList].
@ProviderFor(counterList)
final counterListProvider = AutoDisposeStreamProvider<List<Counter>>.internal(
  counterList,
  name: r'counterListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$counterListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CounterListRef = AutoDisposeStreamProviderRef<List<Counter>>;
String _$counterControllerHash() => r'd430e90255dacec242387e995efcbe74d609f30a';

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
