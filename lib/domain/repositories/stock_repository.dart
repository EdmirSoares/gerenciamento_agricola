import 'package:gerenciamento_agricola/domain/entities/stock_entity.dart';

abstract class IStockRepository {
  Future<void> addStock(StockEntity stock);
  Future<void> updateStock(StockEntity stock);
  Future<List<StockEntity>> getAllStock();
  Future<StockEntity?> getStockById(int id);
  Future<List<StockEntity>> getStockByProductId(int productId);
  Future<List<StockEntity>> getStockExpiringWithin(int days);
  Future<List<StockEntity>> getStockBelowQuantity(double threshold);
  Future<List<StockEntity>> searchStockByProductName(String query);
  Future<void> deleteStockByProductId(int productId);
  Future<void> deleteExpiredStock();
  Future<void> deleteStockBelowQuantity(double threshold);
  Future<void> deleteStockById(int id);
  Future<void> deleteStockByIds(List<int> ids);
  Future<void> deleteAllStock();
}
