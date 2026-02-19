import 'package:drift/drift.dart';
import 'package:gerenciamento_agricola/data/database/app_database.dart';
import 'package:gerenciamento_agricola/domain/entities/stock_entity.dart';
import 'package:gerenciamento_agricola/domain/repositories/stock_repository.dart';

class StockRepositoryImpl implements IStockRepository {
  final AppDatabase _db;

  StockRepositoryImpl(this._db);

  @override
  Future<void> addStock(StockEntity stock) async {
    final companion = FarmStockCompanion(
      productId: Value<int>(stock.productId),
      quantity: Value<double>(stock.quantity),
      minimumStock: Value<double?>(stock.minimumStock),
      location: Value<String?>(stock.location),
      lotNumber: Value<String?>(stock.lotNumber),
      expirationDate: Value<DateTime?>(stock.expirationDate),
      createdAt: Value<DateTime>(stock.createdAt),
      updatedAt: Value<DateTime>(stock.updatedAt),
      isDeleted: Value<bool>(stock.isDeleted),
    );

    await _db.into(_db.farmStock).insert(companion);
  }

  @override
  Future<void> updateStock(StockEntity stock) async {
    if (stock.id == null) {
      throw Exception('Informe o ID do estoque para atualização');
    }

    final companion = FarmStockCompanion(
      id: Value<int>(stock.id!),
      productId: Value<int>(stock.productId),
      quantity: Value<double>(stock.quantity),
      minimumStock: Value<double?>(stock.minimumStock),
      location: Value<String?>(stock.location),
      lotNumber: Value<String?>(stock.lotNumber),
      expirationDate: Value<DateTime?>(stock.expirationDate),
      createdAt: Value<DateTime>(stock.createdAt),
      updatedAt: Value<DateTime>(stock.updatedAt),
      isDeleted: Value<bool>(stock.isDeleted),
    );

    await _db.update(_db.farmStock).replace(companion);
  }

  @override
  Future<List<StockEntity>> getAllStock() async {
    final query = _db.select(_db.farmStock)
      ..where((tbl) => tbl.isDeleted.equals(false));
    final results = await query.get();

    return results.map((row) {
      return StockEntity(
        id: row.id,
        productId: row.productId,
        quantity: row.quantity,
        minimumStock: row.minimumStock,
        location: row.location,
        lotNumber: row.lotNumber,
        expirationDate: row.expirationDate,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
        isDeleted: row.isDeleted,
      );
    }).toList();
  }

  @override
  Future<StockEntity?> getStockById(int id) async {
    final query = _db.select(_db.farmStock)..where((tbl) => tbl.id.equals(id));

    final result = await query.getSingleOrNull();

    if (result == null) {
      return null;
    }

    return StockEntity(
      id: result.id,
      productId: result.productId,
      quantity: result.quantity,
      minimumStock: result.minimumStock,
      location: result.location,
      lotNumber: result.lotNumber,
      expirationDate: result.expirationDate,
      createdAt: result.createdAt,
      updatedAt: result.updatedAt,
      isDeleted: result.isDeleted,
    );
  }

  @override
  Future<List<StockEntity>> getStockExpiringWithin(int days) async {
    final now = DateTime.now();
    final targetDate = now.add(Duration(days: days));
    final query = _db.select(_db.farmStock)
      ..where((tbl) => 
        tbl.expirationDate.isNotNull() &
        tbl.expirationDate.isBetweenValues(now, targetDate) &
        tbl.isDeleted.equals(false)
      );
    final results = await query.get();
    return results.map((row) {
      return StockEntity(
        id: row.id,
        productId: row.productId,
        quantity: row.quantity,
        minimumStock: row.minimumStock,
        location: row.location,
        lotNumber: row.lotNumber,
        expirationDate: row.expirationDate,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
        isDeleted: row.isDeleted,
      );
    }).toList();
  }

  @override
  Future<List<StockEntity>> getStockByProductId(int productId) async {
    final query = _db.select(_db.farmStock)
      ..where((tbl) => 
        tbl.productId.equals(productId) &
        tbl.isDeleted.equals(false)
      );

    final results = await query.get();

    return results.map((row) {
      return StockEntity(
        id: row.id,
        productId: row.productId,
        quantity: row.quantity,
        minimumStock: row.minimumStock,
        location: row.location,
        lotNumber: row.lotNumber,
        expirationDate: row.expirationDate,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
        isDeleted: row.isDeleted,
      );
    }).toList();
  }

  @override
  Future<List<StockEntity>> getStockBelowQuantity(double threshold) async {
    final query = _db.select(_db.farmStock)
      ..where((tbl) => 
        tbl.quantity.isSmallerThanValue(threshold) &
        tbl.isDeleted.equals(false)
      );

    final results = await query.get();

    return results.map((row) {
      return StockEntity(
        id: row.id,
        productId: row.productId,
        quantity: row.quantity,
        minimumStock: row.minimumStock,
        location: row.location,
        lotNumber: row.lotNumber,
        expirationDate: row.expirationDate,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
        isDeleted: row.isDeleted,
      );
    }).toList();
  }

  @override
  Future<List<StockEntity>> searchStockByProductName(String query) async {
    final results = await (_db.select(_db.farmStock).join([
      innerJoin(
        _db.farmProducts,
        _db.farmProducts.id.equalsExp(_db.farmStock.productId),
      ),
    ])..where(
      _db.farmProducts.name.like('%${query.trim()}%') &
      _db.farmStock.isDeleted.equals(false)
    )).get();

    return results.map((row) {
      final stockRow = row.readTable(_db.farmStock);

      return StockEntity(
        id: stockRow.id,
        productId: stockRow.productId,
        quantity: stockRow.quantity,
        minimumStock: stockRow.minimumStock,
        location: stockRow.location,
        lotNumber: stockRow.lotNumber,
        expirationDate: stockRow.expirationDate,
        createdAt: stockRow.createdAt,
        updatedAt: stockRow.updatedAt,
        isDeleted: stockRow.isDeleted,
      );
    }).toList();
  }

  @override
  Future<void> deleteStockByProductId(int productId) async {
    await (_db.delete(
      _db.farmStock,
    )..where((tbl) => tbl.productId.equals(productId))).go();
  }

  @override
  Future<void> deleteExpiredStock() async {
    final now = DateTime.now();
    await (_db.delete(
      _db.farmStock,
    )..where((tbl) => 
      tbl.expirationDate.isNotNull() &
      tbl.expirationDate.isSmallerThanValue(now)
    )).go();
  }

  @override
  Future<void> deleteStockBelowQuantity(double threshold) async {
    await (_db.delete(
      _db.farmStock,
    )..where((tbl) => tbl.quantity.isSmallerThanValue(threshold))).go();
  }

  @override
  Future<void> deleteStockById(int id) async {
    await (_db.delete(_db.farmStock)..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  Future<void> deleteStockByIds(List<int> ids) async {
    await (_db.delete(_db.farmStock)..where((tbl) => tbl.id.isIn(ids))).go();
  }

  @override
  Future<void> deleteAllStock() async {
    await _db.delete(_db.farmStock).go();
  }
}
