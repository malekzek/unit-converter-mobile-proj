
import 'package:flutter/material.dart';
import 'history.dart';
import 'models.dart';

class ConversionPage extends StatefulWidget {
  const ConversionPage({super.key});

  @override
  State<ConversionPage> createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  final Map<String, double> _conversionRates = {
    'km': 1.0,
    'mile': 0.621371,
    'meter': 1000.0,
    'foot': 3280.84,
  };

  String _fromUnit = 'km';
  String _toUnit = 'mile';
  double _inputValue = 0;
  double _result = 0;
  final List<Conversion> _history = [];

  void _calculateConversion() {
    setState(() {
      final double rate = _conversionRates[_toUnit]! / _conversionRates[_fromUnit]!;
      _result = _inputValue * rate;
      _history.add(Conversion(
        fromUnit: _fromUnit,
        toUnit: _toUnit,
        inputValue: _inputValue,
        result: _result,
        timestamp: DateTime.now(),
      ));
    });
  }

  void _showHistory() {
    Navigator.pushNamed(
      context,
      '/history',
      arguments: _history.reversed.toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: _showHistory,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildUnitSelector('From', _fromUnit, true),
            const SizedBox(height: 20),
            _buildUnitSelector('To', _toUnit, false),
            const SizedBox(height: 20),
            _buildInputField(),
            const SizedBox(height: 30),
            Text(
              'Result: ${_result.toStringAsFixed(4)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _calculateConversion,
              child: const Text('Convert'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUnitSelector(String label, String currentValue, bool isFrom) {
    return DropdownButtonFormField<String>(
      value: currentValue,
      items: _conversionRates.keys.map((unit) {
        return DropdownMenuItem(
          value: unit,
          child: Text(unit),
        );
      }).toList(),
      onChanged: (value) => setState(() {
        if (isFrom) {
          _fromUnit = value!;
        } else {
          _toUnit = value!;
        }
      }),
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildInputField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Enter value',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        setState(() {
          _inputValue = double.tryParse(value) ?? 0;
        });
      },
    );
  }
}