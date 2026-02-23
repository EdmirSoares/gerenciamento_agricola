import 'package:gerenciamento_agricola/data/database/tables.dart';
import 'package:gerenciamento_agricola/domain/entities/stock_movements_entity.dart';
import 'package:gerenciamento_agricola/domain/entities/stock_movement_with_product.dart';

abstract class IStockMovementsRepository {
  Future<void> addStockMovement(StockMovementEntity stockMovement);

  Future<void> updateStockMovement(StockMovementEntity stockMovement);

  Future<void> deleteStockMovements(List<int> ids);

  Future<void> deleteAllStockMovements();

  Future<StockMovementEntity?> getStockMovementById(int id);

  Future<List<StockMovementWithProduct>> getAllStockMovements();

  Future<List<StockMovementWithProduct>> getMovementsByProductId(int productId);

  Future<List<StockMovementWithProduct>> getMovementsByType(
    StockMovementType type,
  );

  Future<List<StockMovementWithProduct>> getMovementsByDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  Future<List<StockMovementWithProduct>> searchMovementsByProductName(
    String productName,
  );

  Future<List<StockMovementWithProduct>> getMovementsByCategory(int categoryId);
}
