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
String _$counterHash() => r'740d358d176f171614cac842cdc5a9d76377d87d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [counter].
@ProviderFor(counter)
const counterProvider = CounterFamily();

/// See also [counter].
class CounterFamily extends Family<AsyncValue<Counter?>> {
  /// See also [counter].
  const CounterFamily();

  /// See also [counter].
  CounterProvider call(
    String id,
  ) {
    return CounterProvider(
      id,
    );
  }

  @override
  CounterProvider getProviderOverride(
    covariant CounterProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'counterProvider';
}

/// See also [counter].
class CounterProvider extends AutoDisposeStreamProvider<Counter?> {
  /// See also [counter].
  CounterProvider(
    String id,
  ) : this._internal(
          (ref) => counter(
            ref as CounterRef,
            id,
          ),
          from: counterProvider,
          name: r'counterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$counterHash,
          dependencies: CounterFamily._dependencies,
          allTransitiveDependencies: CounterFamily._allTransitiveDependencies,
          id: id,
        );

  CounterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    Stream<Counter?> Function(CounterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CounterProvider._internal(
        (ref) => create(ref as CounterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Counter?> createElement() {
    return _CounterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CounterProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CounterRef on AutoDisposeStreamProviderRef<Counter?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _CounterProviderElement extends AutoDisposeStreamProviderElement<Counter?>
    with CounterRef {
  _CounterProviderElement(super.provider);

  @override
  String get id => (origin as CounterProvider).id;
}

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
String _$counterControllerHash() => r'4d05fa9601d00bebbabec99e588bb2762ac58c03';

/// See also [CounterController].
@ProviderFor(CounterController)
final counterControllerProvider =
    AutoDisposeNotifierProvider<CounterController, void>.internal(
  CounterController.new,
  name: r'counterControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$counterControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CounterController = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
