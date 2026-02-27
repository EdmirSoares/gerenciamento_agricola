import 'package:gerenciamento_agricola/domain/entities/purchase_entity.dart';

abstract class IPurchaseRepository {
  Future<void> savePurchase(PurchaseEntity purchase);

  Future<List<PurchaseEntity>> getAllPurchases();

  Future<PurchaseEntity?> getPurchaseById(int id);

  Future<List<PurchaseEntity>> getPurchasesBySupplier(int supplierId);

  Future<List<PurchaseEntity>> getPendingPurchases();

  Future<List<PurchaseEntity>> getOverduePurchases();

  Future<List<PurchaseEntity>> getPaidPurchases();

  Future<void> updatePurchase(PurchaseEntity purchase);

  Future<void> deletePurchase(int id);

  Future<void> markAsPaid(int id, DateTime paymentDate);
}
