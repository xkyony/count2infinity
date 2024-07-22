import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/features/counter/controller.dart';

import '../model.dart';
import 'column.dart';

class CounterCard extends ConsumerWidget {
  final Counter counter;
  const CounterCard({
    super.key,
    required this.counter,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Counter values'),
          const Divider(height: 16),
          Wrap(
            children: [
              CounterColumn(
                header: 'Minimum',
                value: counter.minValue,
                at: counter.minAt,
              ),
              CounterColumn(
                header: 'Current',
                value: counter.value,
                at: counter.at,
                elevation: 1,
              ),
              CounterColumn(
                header: 'Maximum',
                value: counter.maxValue,
                at: counter.maxAt,
              ),
            ],
          ),
          const Divider(height: 16),
          ListTile(
            subtitle: Wrap(
              children: [
                const Text('Created by'),
                Text(counter.createdBy),
              ],
            ),
          ),
          const Divider(height: 16),
          OverflowBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () =>
                    ref.read(counterControllerProvider.notifier).reset(counter),
                child: const Icon(Icons.refresh),
              ),
              ElevatedButton(
                onPressed: () => ref
                    .read(counterControllerProvider.notifier)
                    .decrement(counter),
                child: const Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: () => ref
                    .read(counterControllerProvider.notifier)
                    .increment(counter),
                child: const Icon(Icons.add),
              ),
              ElevatedButton(
                onPressed: () => ref
                    .read(counterControllerProvider.notifier)
                    .saveToLocalDisk(counter),
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
        ],
      ),
    );
  }
}
