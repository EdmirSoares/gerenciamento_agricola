import 'package:drift/drift.dart';
import 'package:gerenciamento_agricola/data/database/app_database.dart';
import 'package:gerenciamento_agricola/domain/entities/purchase_entity.dart';
import 'package:gerenciamento_agricola/domain/repositories/purchase_repository.dart';

class PurchaseRepositoryImpl implements IPurchaseRepository {
  final AppDatabase _database;

  PurchaseRepositoryImpl(this._database);

  PurchaseEntity _mapToEntity(FarmPurchase purchase) {
    return PurchaseEntity(
      id: purchase.id,
      supplierId: purchase.supplierId,
      purchaseDate: purchase.purchaseDate,
      totalValueInCents: purchase.totalValueInCents,
      dueDate: purchase.dueDate,
      isPaid: purchase.isPaid,
      paymentDate: purchase.paymentDate,
      description: purchase.description,
      createdAt: purchase.createdAt,
      updatedAt: purchase.updatedAt,
      isDeleted: purchase.isDeleted,
    );
  }

  @override
  Future<void> savePurchase(PurchaseEntity purchase) async {
    await _database
        .into(_database.farmPurchases)
        .insert(
          FarmPurchasesCompanion.insert(
            supplierId: purchase.supplierId,
            purchaseDate: purchase.purchaseDate,
            totalValueInCents: purchase.totalValueInCents,
            dueDate: Value(purchase.dueDate),
            isPaid: Value(purchase.isPaid),
            paymentDate: Value(purchase.paymentDate),
            description: Value(purchase.description),
            createdAt: Value(purchase.createdAt),
            updatedAt: Value(purchase.updatedAt),
          ),
        );
  }

  @override
  Future<List<PurchaseEntity>> getAllPurchases() async {
    final query = _database.select(_database.farmPurchases)
      ..where((tbl) => tbl.isDeleted.equals(false))
      ..orderBy([
        (t) =>
            OrderingTerm(expression: t.purchaseDate, mode: OrderingMode.desc),
      ]);

    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Future<PurchaseEntity?> getPurchaseById(int id) async {
    final query = _database.select(_database.farmPurchases)
      ..where((tbl) => tbl.id.equals(id) & tbl.isDeleted.equals(false));

    final result = await query.getSingleOrNull();
    return result != null ? _mapToEntity(result) : null;
  }

  @override
  Future<List<PurchaseEntity>> getPurchasesBySupplier(int supplierId) async {
    final query = _database.select(_database.farmPurchases)
      ..where(
        (tbl) =>
            tbl.supplierId.equals(supplierId) & tbl.isDeleted.equals(false),
      )
      ..orderBy([
        (t) =>
            OrderingTerm(expression: t.purchaseDate, mode: OrderingMode.desc),
      ]);

    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Future<List<PurchaseEntity>> getPendingPurchases() async {
    final query = _database.select(_database.farmPurchases)
      ..where((tbl) => tbl.isPaid.equals(false) & tbl.isDeleted.equals(false))
      ..orderBy([
        (t) =>
            OrderingTerm(expression: t.purchaseDate, mode: OrderingMode.desc),
      ]);

    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Future<List<PurchaseEntity>> getOverduePurchases() async {
    final now = DateTime.now();
    final query = _database.select(_database.farmPurchases)
      ..where(
        (tbl) =>
            tbl.isPaid.equals(false) &
            tbl.dueDate.isSmallerThanValue(now) &
            tbl.isDeleted.equals(false),
      )
      ..orderBy([
        (t) => OrderingTerm(expression: t.dueDate, mode: OrderingMode.asc),
      ]);

    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Future<List<PurchaseEntity>> getPaidPurchases() async {
    final query = _database.select(_database.farmPurchases)
      ..where((tbl) => tbl.isPaid.equals(true) & tbl.isDeleted.equals(false))
      ..orderBy([
        (t) => OrderingTerm(expression: t.paymentDate, mode: OrderingMode.desc),
      ]);

    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Future<void> updatePurchase(PurchaseEntity purchase) async {
    await (_database.update(
      _database.farmPurchases,
    )..where((tbl) => tbl.id.equals(purchase.id!))).write(
      FarmPurchasesCompanion(
        supplierId: Value(purchase.supplierId),
        purchaseDate: Value(purchase.purchaseDate),
        totalValueInCents: Value(purchase.totalValueInCents),
        dueDate: Value(purchase.dueDate),
        isPaid: Value(purchase.isPaid),
        paymentDate: Value(purchase.paymentDate),
        description: Value(purchase.description),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> deletePurchase(int id) async {
    await (_database.update(
      _database.farmPurchases,
    )..where((tbl) => tbl.id.equals(id))).write(
      FarmPurchasesCompanion(
        isDeleted: Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> markAsPaid(int id, DateTime paymentDate) async {
    await (_database.update(
      _database.farmPurchases,
    )..where((tbl) => tbl.id.equals(id))).write(
      FarmPurchasesCompanion(
        isPaid: Value(true),
        paymentDate: Value(paymentDate),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
