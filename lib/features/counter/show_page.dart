import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/features/counter/controller.dart';
import 'model.dart';
import 'widgets/card.dart';

class CounterShowPage extends ConsumerWidget {
  const CounterShowPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ref.watch(currentCounterProvider).when(
              data: (counter) {
                if (counter == null) {
                  return CounterCard(counter: Counter.initial());
                }
                return CounterCard(counter: counter);
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
            ),
      ),
    );
  }
}

