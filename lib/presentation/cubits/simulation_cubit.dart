import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decimal/decimal.dart';
import 'package:gerenciamento_agricola/domain/repositories/simulation_repository.dart';
import 'simulation_state.dart';
import '../../domain/usecases/calculate_credit_usecase.dart';

class SimulationCubit extends Cubit<SimulationState> {
  final CalculateCreditUseCase _calculateUseCase;
  final ISimulationRepository _repository;

  SimulationCubit(this._calculateUseCase, this._repository)
    : super(SimulationInitial());

  void calculate({
    required String name,
    required String amountStr,
    required String rateStr,
    required int months,
  }) async {
    emit(SimulationLoading());
    try {
      final amount = Decimal.parse(amountStr);
      final rate = (Decimal.parse(rateStr) / Decimal.fromInt(100)).toDecimal();

      final result = _calculateUseCase(
        name: name,
        amount: amount,
        rate: rate,
        months: months,
      );

      await _repository.saveSimulation(result);

      emit(SimulationSuccess(result));
    } catch (e) {
      emit(SimulationError("Erro ao calcular. Verifique os dados."));
    }
  }

  Future<void> loadHistory() async {
    emit(SimulationLoading());
    try {
      final history = await _repository.getAllSimulations();
      emit(SimulationHistoryLoaded(history));
    } catch (e) {
      emit(SimulationError("Erro ao carregar histórico."));
    }
  }
}
