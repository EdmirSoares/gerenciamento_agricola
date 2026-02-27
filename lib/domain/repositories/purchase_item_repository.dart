import '../entities/purchase_item_entity.dart';

abstract class IPurchaseItemRepository {
  Future<PurchaseItemEntity> savePurchaseItem(PurchaseItemEntity item);

  Future<List<PurchaseItemEntity>> getAllPurchaseItems();

  Future<PurchaseItemEntity?> getPurchaseItemById(int id);

  Future<List<PurchaseItemEntity>> getItemsByPurchaseId(int purchaseId);

  Future<List<PurchaseItemEntity>> getItemsByProductId(int productId);

  Future<PurchaseItemEntity> updatePurchaseItem(PurchaseItemEntity item);

  Future<void> deletePurchaseItem(int id);
}
