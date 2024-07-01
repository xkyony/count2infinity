import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'controller.dart';

class CounterIndexPage extends ConsumerWidget {
  const CounterIndexPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counters = ref.watch(counterListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counters'),
      ),
      body: counters.when(
        data: (counters) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Value')),
              ],
              rows: counters.map((counter) {
                return DataRow(
                  // onLongPress: () => context.go('/counters/${counter.id}'),
                  cells: [
                    DataCell(
                      Text(counter.name),
                      onDoubleTap: () => context.go('/counters/${counter.id}'),
                    ),
                    DataCell(Text('${counter.value}')),
                  ],
                );
              }).toList(),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
