import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/features/counter/controller.dart';
import 'package:pharmacy/widgets/async_value_widget.dart';
import 'widgets/card.dart';

class CounterShowPage extends ConsumerWidget {
  const CounterShowPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(counterProvider(id)),
      data: (counter) {
        if (counter == null) {
          return const Text('Counter not found');
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(counter.name),
          ),
          body: Center(
            child: CounterCard(counter: counter),
          ),
        );
      },
    );
  }
}
