import 'package:drift/drift.dart';
import '../../domain/entities/purchase_item_entity.dart';
import '../../domain/repositories/purchase_item_repository.dart';
import '../database/app_database.dart';

class PurchaseItemRepositoryImpl implements IPurchaseItemRepository {
  final AppDatabase _database;

  PurchaseItemRepositoryImpl(this._database);

  PurchaseItemEntity _mapToEntity(FarmPurchaseItem row) {
    return PurchaseItemEntity(
      id: row.id,
      purchaseId: row.purchaseId,
      productId: row.productId,
      quantity: row.quantity,
      unitCostInCents: row.unitCostInCents,
      uuid: row.uuid,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
    );
  }

  @override
  Future<PurchaseItemEntity> savePurchaseItem(PurchaseItemEntity item) async {
    final id = await _database
        .into(_database.farmPurchaseItems)
        .insert(
          FarmPurchaseItemsCompanion.insert(
            purchaseId: item.purchaseId,
            productId: item.productId,
            quantity: item.quantity,
            unitCostInCents: item.unitCostInCents,
          ),
        );

    final savedItem = await getPurchaseItemById(id);
    return savedItem!;
  }

  @override
  Future<List<PurchaseItemEntity>> getAllPurchaseItems() async {
    final query = _database.select(_database.farmPurchaseItems)
      ..where((t) => t.isDeleted.equals(false))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Future<PurchaseItemEntity?> getPurchaseItemById(int id) async {
    final query = _database.select(_database.farmPurchaseItems)
      ..where((t) => t.id.equals(id) & t.isDeleted.equals(false));

    final result = await query.getSingleOrNull();
    return result != null ? _mapToEntity(result) : null;
  }

  @override
  Future<List<PurchaseItemEntity>> getItemsByPurchaseId(int purchaseId) async {
    final query = _database.select(_database.farmPurchaseItems)
      ..where(
        (t) => t.purchaseId.equals(purchaseId) & t.isDeleted.equals(false),
      )
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Future<List<PurchaseItemEntity>> getItemsByProductId(int productId) async {
    final query = _database.select(_database.farmPurchaseItems)
      ..where((t) => t.productId.equals(productId) & t.isDeleted.equals(false))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Future<PurchaseItemEntity> updatePurchaseItem(PurchaseItemEntity item) async {
    await (_database.update(
      _database.farmPurchaseItems,
    )..where((t) => t.id.equals(item.id!))).write(
      FarmPurchaseItemsCompanion(
        purchaseId: Value(item.purchaseId),
        productId: Value(item.productId),
        quantity: Value(item.quantity),
        unitCostInCents: Value(item.unitCostInCents),
        updatedAt: Value(DateTime.now()),
      ),
    );

    final updatedItem = await getPurchaseItemById(item.id!);
    return updatedItem!;
  }

  @override
  Future<void> deletePurchaseItem(int id) async {
    await (_database.update(
      _database.farmPurchaseItems,
    )..where((t) => t.id.equals(id))).write(
      FarmPurchaseItemsCompanion(
        isDeleted: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
