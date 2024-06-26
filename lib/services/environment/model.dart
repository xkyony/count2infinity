enum Env {
  dev(name: 'DEV', useEmulator: true, useMock: false),
  test(name: 'TEST', useEmulator: true, useMock: false),
  integrationTest(name: 'INTEGRATION_TEST', useEmulator: true, useMock: false),
  stag(name: 'STAG', useEmulator: true, useMock: false),
  prod(name: 'PROD', useEmulator: true, useMock: false),
  ;

  final String name;

  final bool useEmulator;
  final bool useMock;
  const Env({
    required this.name,
    required this.useEmulator,
    required this.useMock,
  });

  factory Env.fromString([String name = 'DEV']) {
    return Env.values.firstWhere(
      (env) => env.name == name,
      orElse: () => Env.dev,
    );
  }

  @override
  String toString() {
    return 'Env.$name useEmulator: $useEmulator, useMock: $useMock';
  }
}
