import 'package:decimal/decimal.dart';
import '../entities/simulation_entity.dart';

class CalculateCreditUseCase {
  SimulationEntity call({
    required String name,
    required Decimal amount,
    required Decimal rate,
    required int months,
  }) {
    // Cálculo: M = P * (1 + i)^n
    final one = Decimal.one;
    final ratePlusOne = one + rate;
    final powFactor = ratePlusOne.pow(months).toDecimal();
    final total = amount * powFactor;
    
    // Arredonda para 2 casas decimais
    final totalRounded = Decimal.parse(total.toStringAsFixed(2));

    return SimulationEntity(
      producerName: name,
      principalAmount: amount,
      interestRate: rate,
      periods: months,
      totalAmount: totalRounded,
      createdAt: DateTime.now(),
    );
  }
}