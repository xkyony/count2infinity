import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pharmacy/features/counter/model.dart';

class CounterForm extends HookConsumerWidget {
  final String? id;
  final Counter? counter;
  final Function(String name, int value) onSubmit;

  const CounterForm({
    super.key,
    this.id,
    this.counter,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController(text: counter?.name ?? '');
    final valueController =
        useTextEditingController(text: counter?.value.toString() ?? '');

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            key: const Key('counter name'),
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Counter Name',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            key: const Key('counter value'),
            controller: valueController,
            decoration: const InputDecoration(
              labelText: 'Counter Value',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 32),
          Center(
            child: ElevatedButton(
              key: Key(counter == null ? 'Add Counter' : 'Edit Counter'),
              onPressed: () async {
                final name = nameController.text;
                final value = int.tryParse(valueController.text) ?? 0;
                onSubmit(name, value);
              },
              child: Text(counter == null ? 'Add Counter' : 'Save Counter'),
            ),
          ),
        ],
      ),
    );
  }
}
