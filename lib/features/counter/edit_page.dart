import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pharmacy/widgets/async_value_widget.dart';
import 'package:pharmacy/features/counter/controller.dart';
import 'package:pharmacy/features/counter/model.dart';

import 'widgets/form.dart';

class CounterEditPage extends HookConsumerWidget {
  const CounterEditPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

          return CounterForm(
            counter: counter,
            onSubmit: (name, value) async {
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
          );
        },
      ),
    );
  }
}
