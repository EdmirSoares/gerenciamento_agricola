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
    final companion = SimulationsCompanion.insert(
      producerName: entity.producerName,
      principalAmountInCents: (entity.principalAmount * Decimal.fromInt(100)).toBigInt().toInt(),
      interestRateBasisPoints: (entity.interestRate * Decimal.fromInt(100)).toBigInt().toInt(),
      periods: entity.periods,
      totalAmountInCents: (entity.totalAmount * Decimal.fromInt(100)).toBigInt().toInt(),
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
        principalAmount: (Decimal.fromInt(row.principalAmountInCents) / Decimal.fromInt(100)).toDecimal(),
        interestRate: (Decimal.fromInt(row.interestRateBasisPoints) / Decimal.fromInt(100)).toDecimal(),
        periods: row.periods,
        totalAmount: (Decimal.fromInt(row.totalAmountInCents) / Decimal.fromInt(100)).toDecimal(),
        createdAt: row.createdAt,
        isSynced: row.isSynced,
      );
    }).toList();
  }

  @override
  Future<void> syncSimulations() async {
    throw UnimplementedError();
  }
}
