import '../entities/production_entity.dart';

abstract class IProductionRepository {
  Future<ProductionEntity> saveProduction(ProductionEntity production);

  Future<List<ProductionEntity>> getAllProductions();

  Future<ProductionEntity?> getProductionById(int id);

  Future<List<ProductionEntity>> getProductionsByProductId(int productId);

  Future<List<ProductionEntity>> getProductionsByAreaId(int areaId);

  Future<List<ProductionEntity>> getProductionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  Future<List<ProductionEntity>> getProfitableProductions();

  Future<ProductionEntity> updateProduction(ProductionEntity production);

  Future<void> deleteProduction(int id);
}
