import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pharmacy/features/counter/controller.dart';
import 'package:pharmacy/features/counter/model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uuid/uuid.dart';

class CounterNewPage extends HookConsumerWidget {
  const CounterNewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final valueController = TextEditingController();
    const uuid = Uuid();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Counter'),
      ),
      body: Padding(
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
                key: const Key('Add Counter'),
                onPressed: () async {
                  final name = nameController.text;
                  final value = int.tryParse(valueController.text) ?? 0;
                  final counter = Counter(
                    id: uuid.v4(),
                    name: name,
                    value: value,
                    at: DateTime.now(),
                    minValue: value,
                    minAt: DateTime.now(),
                    maxValue: value,
                    maxAt: DateTime.now(),
                  );
                  await ref
                      .read(counterControllerProvider.notifier)
                      .add(counter);
                  if (context.mounted) {
                    context.pop();
                  }
                },
                child: const Text('Add Counter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
