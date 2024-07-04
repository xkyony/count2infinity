import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pharmacy/features/counter/controller.dart';
import 'package:pharmacy/features/counter/model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pharmacy/widgets/async_value_widget.dart';

class CounterEditPage extends HookConsumerWidget {
  const CounterEditPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final valueController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Counter'),
      ),
      body: AsyncValueWidget<Counter?>(
        value: ref.watch(counterProvider(id)),
        data: (counter) {
          if (counter == null) {
            return Text('Counter #$id was not found!');
          }

          nameController.text = counter.name;
          valueController.text = counter.value.toString();

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
                    labelText: 'Initial Value',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    key: const Key('Edit Counter'),
                    onPressed: () async {
                      final name = nameController.text;
                      final value = int.tryParse(valueController.text) ?? 0;
                      final updatedCounter = counter.copyWith(
                        name: name,
                        value: value,
                        at: DateTime.now(),
                      );
                      await ref
                          .read(counterControllerProvider.notifier)
                          .add(updatedCounter);
                      if (context.mounted) {
                        context.pop();
                      }
                    },
                    child: const Text('Save Counter'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
