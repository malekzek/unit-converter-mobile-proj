
class Conversion {
  final String fromUnit;
  final String toUnit;
  final double inputValue;
  final double result;
  final DateTime timestamp;

  Conversion({
    required this.fromUnit,
    required this.toUnit,
    required this.inputValue,
    required this.result,
    required this.timestamp,
  });

  String get description =>
      '$inputValue $fromUnit → $result $toUnit';
}