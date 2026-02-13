import 'package:decimal/decimal.dart';

class SimulationEntity {
  final int? id;
  final String producerName;
  final Decimal principalAmount; // Valor do empréstimo
  final Decimal interestRate;    // Taxa de juros (ex: 0.05 para 5%)
  final int periods;             // Meses ou anos
  final Decimal totalAmount;     // Resultado calculado
  final DateTime createdAt;
  final bool isSynced;

  SimulationEntity({
    this.id,
    required this.producerName,
    required this.principalAmount,
    required this.interestRate,
    required this.periods,
    required this.totalAmount,
    required this.createdAt,
    this.isSynced = false,
  });
}