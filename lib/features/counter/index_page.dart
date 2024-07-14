import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy/widgets/async_value_widget.dart';

import 'controller.dart';

class CounterIndexPage extends ConsumerWidget {
  const CounterIndexPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(counterListProvider),
      data: (counters) => Scaffold(
        appBar: AppBar(
          title: Text('${counters.length} Counters'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Value')),
              DataColumn(label: Text('')),
            ],
            rows: counters.map((counter) {
              return DataRow(
                // onLongPress: () => context.go('/counters/${counter.id}'),
                cells: [
                  DataCell(
                    Text(
                      key: Key('counter_name_${counter.id}'),
                      counter.name,
                    ),
                    onDoubleTap: () {
                      context.go('/counters/${counter.id}');
                    },
                  ),
                  DataCell(
                    Text(
                      key: Key('counter_value_${counter.id}'),
                      '${counter.value}',
                    ),
                    onDoubleTap: () => context.go('/counters/${counter.id}'),
                  ),
                  DataCell(
                    Wrap(
                      children: [
                        IconButton(
                          key: Key('edit_button_${counter.id}'),
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            context.go('/counters/${counter.id}/edit');
                          },
                        ),
                        IconButton(
                          key: Key('delete_button_${counter.id}'),
                          color: Colors.red,
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            ref
                                .read(counterControllerProvider.notifier)
                                .delete(counter);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.go('/counters/new'),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
