import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CounterColumn extends StatelessWidget {
  final String header;
  final int value;
  final DateTime at;
  final String dateFormat;
  final double elevation;

  const CounterColumn({
    super.key,
    required this.header,
    required this.value,
    required this.at,
    this.dateFormat = 'HH:mm:ss',
    this.elevation = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(dateFormat).format(at);

    return Card(
      elevation: elevation,
      // margin: const EdgeInsets.symmetric(
      //   vertical: 4,
      //   horizontal: 4,
      // ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              header,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              key: Key('counter_${header.toLowerCase()}_value'),
              '$value',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.blueAccent,
                    fontSize: 32,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              key: Key('counter_${header.toLowerCase()}_at'),
              formattedDate,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
