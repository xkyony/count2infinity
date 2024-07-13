import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pharmacy/features/counter/model.dart';
import 'package:pharmacy/features/counter/controller.dart';
import 'package:uuid/uuid.dart';


import 'widgets/form.dart';

class CounterNewPage extends HookConsumerWidget {
  const CounterNewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const uuid = Uuid();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Counter'),
      ),
      body: CounterForm(
        onSubmit: (name, value) async {
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
          await ref.read(counterControllerProvider.notifier).add(counter);
          if (context.mounted) {
            context.pop();
          }
        },
      ),
    );
  }
}
