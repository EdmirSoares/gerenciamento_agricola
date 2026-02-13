import 'package:decimal/decimal.dart';
import 'package:drift/drift.dart';
import '../../domain/entities/simulation_entity.dart';
import '../../domain/repositories/simulation_repository.dart';
import '../database/app_database.dart';

class SimulationRepositoryImpl implements ISimulationRepository {
  final AppDatabase _db;

  SimulationRepositoryImpl(this._db);

  @override
  Future<void> saveSimulation(SimulationEntity entity) async {
    // Converte a Entidade para um "Companion" do Drift para salvar
    final companion = SimulationsCompanion.insert(
      producerName: entity.producerName,
      principalAmount: entity.principalAmount.toString(),
      interestRate: entity.interestRate.toString(),
      periods: entity.periods,
      totalAmount: entity.totalAmount.toString(),
      createdAt: Value(entity.createdAt),
    );

    await _db.saveSimulation(companion);
  }

  @override
  Future<List<SimulationEntity>> getAllSimulations() async {
    final results = await _db.select(_db.simulations).get();

    return results.map((row) {
      return SimulationEntity(
        id: row.id,
        producerName: row.producerName,
        principalAmount: Decimal.parse(row.principalAmount),
        interestRate: Decimal.parse(row.interestRate),
        periods: row.periods,
        totalAmount: Decimal.parse(row.totalAmount),
        createdAt: row.createdAt,
        isSynced: row.isSynced,
      );
    }).toList();
  }

  @override
  Future<void> syncSimulations() async {
    // Implementaremos quando tivermos uma API
    throw UnimplementedError();
  }
}
