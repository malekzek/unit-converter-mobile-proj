
import 'package:flutter/material.dart';
import 'conversion.dart';
import 'history.dart';

void main() => runApp(const UnitConverterApp());

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (context) => const ConversionPage(),
        '/history': (context) => const HistoryPage(),
      },
    );
  }
}