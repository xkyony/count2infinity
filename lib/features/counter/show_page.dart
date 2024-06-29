import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pharmacy/features/counter/controller.dart';
import 'package:pharmacy/widgets/async_value_widget.dart';

class CounterShowPage extends ConsumerWidget {
  const CounterShowPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: AsyncValueWidget(
          value: ref.watch(currentCounterProvider),
          data: (counter) {
            final time = DateFormat('HH:mm:ss dd-MMM-yyyy').format(counter!.at);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    title: const Text('The counter value:'),
                    subtitle: Text(
                      key: const Key('counter_at'),
                      time,
                    ),
                    trailing: Text(
                      key: const Key('counter_value'),
                      '${counter.value}',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  title: const Text('The counter min value'),
                  subtitle: Text(
                    key: const Key('counter_min_at'),
                    '${counter.minAt}',
                  ),
                  trailing: Text(
                    key: const Key('counter_min_value'),
                    '${counter.minValue}',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  title: const Text('The counter max value'),
                  subtitle: Text(
                    key: const Key('counter_max_at'),
                    '${counter.maxAt}',
                  ),
                  trailing: Text(
                    key: const Key('counter_max_value'),
                    '${counter.maxValue}',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                  ),
                ),
              ],
            );
          },
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
              onPressed:
                  ref.read(counterControllerProvider.notifier).saveToLocalDisk,
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
