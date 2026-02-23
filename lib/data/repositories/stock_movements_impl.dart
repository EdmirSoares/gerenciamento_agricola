import 'package:drift/drift.dart';
import 'package:gerenciamento_agricola/data/database/app_database.dart';
import 'package:gerenciamento_agricola/data/database/tables.dart';
import 'package:gerenciamento_agricola/domain/entities/stock_movements_entity.dart';
import 'package:gerenciamento_agricola/domain/entities/stock_movement_with_product.dart';
import 'package:gerenciamento_agricola/domain/repositories/stock_movements_repository.dart';

class StockMovementsImpl implements IStockMovementsRepository {
  final AppDatabase _db;

  StockMovementsImpl(this._db);

  @override
  Future<void> addStockMovement(StockMovementEntity stockMovement) async {
    final companion = FarmStockMovementsCompanion(
      productId: Value<int>(stockMovement.productId),
      quantity: Value<double>(stockMovement.quantity),
      type: Value<StockMovementType>(stockMovement.type),
      unitCostInCents: Value<int?>(stockMovement.unitCostInCents),
      referenceType: Value<String?>(stockMovement.referenceType),
      createdAt: Value<DateTime>(stockMovement.createdAt),
      updatedAt: Value<DateTime>(stockMovement.updatedAt),
      isDeleted: Value<bool>(stockMovement.isDeleted),
    );

    await _db.into(_db.farmStockMovements).insert(companion);
  }

  @override
  Future<void> updateStockMovement(StockMovementEntity stockMovement) async {
    if (stockMovement.id == null) {
      throw Exception('Informe o ID do movimento de estoque para atualização');
    }

    final companion = FarmStockMovementsCompanion(
      id: Value<int>(stockMovement.id!),
      productId: Value<int>(stockMovement.productId),
      quantity: Value<double>(stockMovement.quantity),
      type: Value<StockMovementType>(stockMovement.type),
      unitCostInCents: Value<int?>(stockMovement.unitCostInCents),
      referenceType: Value<String?>(stockMovement.referenceType),
      createdAt: Value<DateTime>(stockMovement.createdAt),
      updatedAt: Value<DateTime>(stockMovement.updatedAt),
      isDeleted: Value<bool>(stockMovement.isDeleted),
    );

    await _db.update(_db.farmStockMovements).replace(companion);
  }

  @override
  Future<void> deleteStockMovements(List<int> ids) async {
    if (ids.isEmpty) return;

    await (_db.update(
      _db.farmStockMovements,
    )..where((tbl) => tbl.id.isIn(ids))).write(
      const FarmStockMovementsCompanion(
        isDeleted: Value(true),
        updatedAt: Value.absent(),
      ),
    );
  }

  @override
  Future<void> deleteAllStockMovements() async {
    await _db
        .update(_db.farmStockMovements)
        .write(
          const FarmStockMovementsCompanion(
            isDeleted: Value(true),
            updatedAt: Value.absent(),
          ),
        );
  }

  @override
  Future<StockMovementEntity?> getStockMovementById(int id) async {
    final query = _db.select(_db.farmStockMovements)
      ..where((tbl) => tbl.id.equals(id) & tbl.isDeleted.equals(false));

    final result = await query.getSingleOrNull();

    if (result == null) {
      return null;
    }

    return _mapToEntity(result);
  }

  @override
  Future<List<StockMovementWithProduct>> getAllStockMovements() async {
    final query = _db.select(_db.farmStockMovements).join([
      innerJoin(
        _db.farmProducts,
        _db.farmProducts.id.equalsExp(_db.farmStockMovements.productId),
      ),
    ])
      ..where(
        _db.farmStockMovements.isDeleted.equals(false) &
            _db.farmProducts.isDeleted.equals(false),
      )
      ..orderBy([OrderingTerm.desc(_db.farmStockMovements.createdAt)]);

    final results = await query.get();
    return results.map(_mapToDto).toList();
  }

  @override
  Future<List<StockMovementWithProduct>> getMovementsByProductId(
    int productId,
  ) async {
    if (productId <= 0) {
      throw ArgumentError('Produto não encontrado para o ID fornecido');
    }

    final query = _db.select(_db.farmStockMovements).join([
      innerJoin(
        _db.farmProducts,
        _db.farmProducts.id.equalsExp(_db.farmStockMovements.productId),
      ),
    ])
      ..where(
        _db.farmStockMovements.productId.equals(productId) &
            _db.farmStockMovements.isDeleted.equals(false) &
            _db.farmProducts.isDeleted.equals(false),
      )
      ..orderBy([OrderingTerm.desc(_db.farmStockMovements.createdAt)]);

    final results = await query.get();
    return results.map(_mapToDto).toList();
  }

  @override
  Future<List<StockMovementWithProduct>> getMovementsByType(
    StockMovementType type,
  ) async {
    final query = _db.select(_db.farmStockMovements).join([
      innerJoin(
        _db.farmProducts,
        _db.farmProducts.id.equalsExp(_db.farmStockMovements.productId),
      ),
    ])
      ..where(
        _db.farmStockMovements.type.equals(type.index) &
            _db.farmStockMovements.isDeleted.equals(false) &
            _db.farmProducts.isDeleted.equals(false),
      )
      ..orderBy([OrderingTerm.desc(_db.farmStockMovements.createdAt)]);

    final results = await query.get();
    return results.map(_mapToDto).toList();
  }

  @override
  Future<List<StockMovementWithProduct>> getMovementsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    if (endDate.isBefore(startDate)) {
      throw ArgumentError('Data final deve ser posterior à data inicial');
    }

    final query = _db.select(_db.farmStockMovements).join([
      innerJoin(
        _db.farmProducts,
        _db.farmProducts.id.equalsExp(_db.farmStockMovements.productId),
      ),
    ])
      ..where(
        _db.farmStockMovements.createdAt.isBiggerOrEqualValue(startDate) &
            _db.farmStockMovements.createdAt.isSmallerOrEqualValue(endDate) &
            _db.farmStockMovements.isDeleted.equals(false) &
            _db.farmProducts.isDeleted.equals(false),
      )
      ..orderBy([OrderingTerm.desc(_db.farmStockMovements.createdAt)]);

    final results = await query.get();
    return results.map(_mapToDto).toList();
  }

  StockMovementEntity _mapToEntity(FarmStockMovement row) {
    return StockMovementEntity(
      id: row.id,
      productId: row.productId,
      quantity: row.quantity,
      type: row.type,
      unitCostInCents: row.unitCostInCents,
      referenceType: row.referenceType,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
    );
  }

  @override
  Future<List<StockMovementWithProduct>> searchMovementsByProductName(
    String productName,
  ) async {
    final trimmedName = productName.trim();
    if (trimmedName.isEmpty) {
      throw ArgumentError('Informe um nome de produto para busca');
    }

    final query =
        _db.select(_db.farmStockMovements).join([
            innerJoin(
              _db.farmProducts,
              _db.farmProducts.id.equalsExp(_db.farmStockMovements.productId),
            ),
          ])
          ..where(
            _db.farmProducts.name.like('%$trimmedName%') &
                _db.farmStockMovements.isDeleted.equals(false) &
                _db.farmProducts.isDeleted.equals(false),
          )
          ..orderBy([OrderingTerm.desc(_db.farmStockMovements.createdAt)]);

    final results = await query.get();
    return results.map(_mapToDto).toList();
  }

  @override
  Future<List<StockMovementWithProduct>> getMovementsByCategory(
    int categoryId,
  ) async {
    if (categoryId <= 0) {
      throw ArgumentError('Categoria não encontrada para o ID fornecido');
    }

    final query =
        _db.select(_db.farmStockMovements).join([
            innerJoin(
              _db.farmProducts,
              _db.farmProducts.id.equalsExp(_db.farmStockMovements.productId),
            ),
          ])
          ..where(
            _db.farmProducts.categoryId.equals(categoryId) &
                _db.farmStockMovements.isDeleted.equals(false) &
                _db.farmProducts.isDeleted.equals(false),
          )
          ..orderBy([OrderingTerm.desc(_db.farmStockMovements.createdAt)]);

    final results = await query.get();
    return results.map(_mapToDto).toList();
  }

  StockMovementWithProduct _mapToDto(TypedResult row) {
    final movement = row.readTable(_db.farmStockMovements);
    final product = row.readTable(_db.farmProducts);

    return StockMovementWithProduct(
      movementId: movement.id,
      productId: movement.productId,
      type: movement.type,
      quantity: movement.quantity,
      unitCostInCents: movement.unitCostInCents,
      referenceType: movement.referenceType,
      createdAt: movement.createdAt,
      updatedAt: movement.updatedAt,
      productName: product.name,
      productUnit: product.unit,
      categoryId: product.categoryId,
      productDescription: product.description,
      isProduction: product.isProduction,
    );
  }
}
