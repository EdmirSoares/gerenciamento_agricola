import '../entities/simulation_entity.dart';

abstract class ISimulationRepository {
  Future<void> saveSimulation(SimulationEntity simulation);
  Future<List<SimulationEntity>> getAllSimulations();
  Future<void> syncSimulations();
}