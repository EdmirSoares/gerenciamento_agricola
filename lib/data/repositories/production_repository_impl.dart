import 'package:drift/drift.dart';
import '../../domain/entities/production_entity.dart';
import '../../domain/repositories/production_repository.dart';
import '../database/app_database.dart';

class ProductionRepositoryImpl implements IProductionRepository {
  final AppDatabase _database;

  ProductionRepositoryImpl(this._database);

  ProductionEntity _mapToEntity(FarmProduction row) {
    return ProductionEntity(
      id: row.id,
      productId: row.productId,
      productionAreaId: row.productionAreaId,
      quantity: row.quantity,
      unitPriceInCents: row.unitPriceInCents,
      productionCostInCents: row.productionCostInCents,
      harvestDate: row.harvestDate,
      uuid: row.uuid,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
    );
  }

  @override
  Future<ProductionEntity> saveProduction(ProductionEntity production) async {
    final id = await _database.into(_database.farmProductions).insert(
          FarmProductionsCompanion.insert(
            productId: production.productId,
            productionAreaId: production.productionAreaId,
            quantity: production.quantity,
            unitPriceInCents: production.unitPriceInCents,
            productionCostInCents: production.productionCostInCents,
            harvestDate: production.harvestDate,
          ),
        );

    final savedProduction = await getProductionById(id);
    return savedProduction!;
  }

  @override
  Future<List<ProductionEntity>> getAllProductions() async {
    final query = _database.select(_database.farmProductions)
      ..where((t) => t.isDeleted.equals(false))
      ..orderBy([(t) => OrderingTerm.desc(t.harvestDate)]);

    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Future<ProductionEntity?> getProductionById(int id) async {
    final query = _database.select(_database.farmProductions)
      ..where((t) => t.id.equals(id) & t.isDeleted.equals(false));

    final result = await query.getSingleOrNull();
    return result != null ? _mapToEntity(result) : null;
  }

  @override
  Future<List<ProductionEntity>> getProductionsByProductId(int productId) async {
    final query = _database.select(_database.farmProductions)
      ..where((t) => t.productId.equals(productId) & t.isDeleted.equals(false))
      ..orderBy([(t) => OrderingTerm.desc(t.harvestDate)]);

    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Future<List<ProductionEntity>> getProductionsByAreaId(int areaId) async {
    final query = _database.select(_database.farmProductions)
      ..where((t) => t.productionAreaId.equals(areaId) & t.isDeleted.equals(false))
      ..orderBy([(t) => OrderingTerm.desc(t.harvestDate)]);

    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Future<List<ProductionEntity>> getProductionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final query = _database.select(_database.farmProductions)
      ..where((t) =>
          t.harvestDate.isBiggerOrEqualValue(startDate) &
          t.harvestDate.isSmallerOrEqualValue(endDate) &
          t.isDeleted.equals(false))
      ..orderBy([(t) => OrderingTerm.desc(t.harvestDate)]);

    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Future<List<ProductionEntity>> getProfitableProductions() async {
    final query = _database.select(_database.farmProductions)
      ..where((t) => t.isDeleted.equals(false))
      ..orderBy([(t) => OrderingTerm.desc(t.harvestDate)]);

    final results = await query.get();
    final entities = results.map(_mapToEntity).toList();
    
    return entities.where((p) => p.isProfitable).toList();
  }

  @override
  Future<ProductionEntity> updateProduction(ProductionEntity production) async {
    await (_database.update(_database.farmProductions)
          ..where((t) => t.id.equals(production.id!)))
        .write(
      FarmProductionsCompanion(
        productId: Value(production.productId),
        productionAreaId: Value(production.productionAreaId),
        quantity: Value(production.quantity),
        unitPriceInCents: Value(production.unitPriceInCents),
        productionCostInCents: Value(production.productionCostInCents),
        harvestDate: Value(production.harvestDate),
        updatedAt: Value(DateTime.now()),
      ),
    );

    final updatedProduction = await getProductionById(production.id!);
    return updatedProduction!;
  }

  @override
  Future<void> deleteProduction(int id) async {
    await (_database.update(_database.farmProductions)
          ..where((t) => t.id.equals(id)))
        .write(
      FarmProductionsCompanion(
        isDeleted: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
