import 'package:gerenciamento_agricola/domain/entities/simulation_entity.dart';

abstract class SimulationState {}

class SimulationInitial extends SimulationState {}

class SimulationLoading extends SimulationState {}

class SimulationSuccess extends SimulationState {
  final SimulationEntity result;
  SimulationSuccess(this.result);
}

class SimulationError extends SimulationState {
  final String message;
  SimulationError(this.message);
}

class SimulationHistoryLoaded extends SimulationState {
  final List<SimulationEntity> history;
  SimulationHistoryLoaded(this.history);
}
