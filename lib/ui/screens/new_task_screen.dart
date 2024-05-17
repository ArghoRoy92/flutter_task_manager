import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewTask extends StatelessWidget {
  const NewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SummaryCard(number: 123, title: 'New'),
                ),
                Expanded(
                  child: SummaryCard(number: 123, title: 'Inprogress'),
                ),
                Expanded(
                  child: SummaryCard(number: 123, title: 'Cancel'),
                ),
                Expanded(
                  child: SummaryCard(number: 123, title: 'Completed'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.number,
    required this.title,
  });

  final int number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              '$number',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              title,
            )
          ],
        ),
      ),
    );
  }
}
