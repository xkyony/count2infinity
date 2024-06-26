import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/features/counter/controller.dart';

class CounterShowPage extends ConsumerWidget {
  const CounterShowPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, ref) {
    final counter = ref.watch(counterControllerProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('At ${counter.at} The counter value is:'),
            Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Wrap(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ElevatedButton(
              onPressed: ref.read(counterControllerProvider.notifier).decrement,
              child: const Icon(Icons.remove),
            ),
            ElevatedButton(
              onPressed: ref.read(counterControllerProvider.notifier).increment,
              child: const Icon(Icons.add),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: ref.read(counterControllerProvider.notifier).reset,
              child: const Icon(Icons.refresh),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(counterControllerProvider.notifier).saveToLocalDisk();
              },
              child: const Icon(Icons.save),
            ),
            ElevatedButton(
              onPressed: ref
                  .read(counterControllerProvider.notifier)
                  .retrieveFromLocalDisk,
              child: const Icon(Icons.restore),
            ),
          ],
        ),
      ),
    );
  }
}
