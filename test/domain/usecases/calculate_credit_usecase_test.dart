import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciamento_agricola/domain/usecases/calculate_credit_usecase.dart';

void main() {
  late CalculateCreditUseCase useCase;

  setUp(() {
    useCase = CalculateCreditUseCase();
  });

  group('CalculateCreditUseCase - Testes de Cálculo de Juros', () {
    test('Deve calcular o montante final corretamente para um cenário padrão', () {

      final name = "João Fazendeiro";
      final amount = Decimal.parse("1000.00");
      final rate = Decimal.parse("0.01");
      final months = 12;

      final result = useCase(
        name: name,
        amount: amount,
        rate: rate,
        months: months,
      );

      expect(result.totalAmount.toString(), "1126.83");
      expect(result.producerName, name);
    });

    test('Deve retornar o valor principal se o juros for zero', () {
      final amount = Decimal.parse("5000.00");
      
      final result = useCase(
        name: "Teste Zero",
        amount: amount,
        rate: Decimal.zero,
        months: 24,
      );

      expect(result.totalAmount, amount);
    });

    test('Deve lidar com períodos de 0 meses (retornar o valor original)', () {
      final amount = Decimal.parse("2500.00");

      final result = useCase(
        name: "Teste Mes 0",
        amount: amount,
        rate: Decimal.parse("0.05"),
        months: 0,
      );

      expect(result.totalAmount, amount);
    });
  });
}