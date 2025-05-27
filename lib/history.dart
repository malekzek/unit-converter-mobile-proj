
import 'package:flutter/material.dart';
import 'models.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Conversion> history =
    ModalRoute.of(context)!.settings.arguments as List<Conversion>;

    return Scaffold(
      appBar: AppBar(title: const Text('Conversion History')),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final conversion = history[index];
          return ListTile(
            title: Text(conversion.description),
            subtitle: Text(
              '${conversion.timestamp.hour}:${conversion.timestamp.minute}',
            ),
          );
        },
      ),
    );
  }
}