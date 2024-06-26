import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers.dart';

class AppInitialization extends ConsumerWidget {
  const AppInitialization({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final initialization = ref.watch(localStorageRepositoryProvider);
    // if (initialization.isLoading) {
    //   return const CircularProgressIndicator();
    // } else if (initialization.hasError) {
    //   return const Text('Oopsy');
    // }
    return child;
  }
}
