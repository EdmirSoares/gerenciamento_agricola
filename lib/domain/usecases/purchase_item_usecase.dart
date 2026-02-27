import '../entities/purchase_item_entity.dart';
import '../repositories/purchase_item_repository.dart';

class CreatePurchaseItemUseCase {
  final IPurchaseItemRepository _repository;

  CreatePurchaseItemUseCase(this._repository);

  Future<PurchaseItemEntity> call(PurchaseItemEntity item) async {
    try {
      if (!item.isValid) {
        throw ArgumentError('Dados do item de compra são inválidos');
      }
      return await _repository.savePurchaseItem(item);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao criar item de compra: $e');
    }
  }
}

class GetAllPurchaseItemsUseCase {
  final IPurchaseItemRepository _repository;

  GetAllPurchaseItemsUseCase(this._repository);

  Future<List<PurchaseItemEntity>> call() async {
    try {
      return await _repository.getAllPurchaseItems();
    } catch (e) {
      throw Exception('Falha ao recuperar itens de compra: $e');
    }
  }
}

class GetPurchaseItemByIdUseCase {
  final IPurchaseItemRepository _repository;

  GetPurchaseItemByIdUseCase(this._repository);

  Future<PurchaseItemEntity?> call(int id) async {
    try {
      if (id <= 0) {
        throw ArgumentError('ID do item de compra inválido');
      }
      return await _repository.getPurchaseItemById(id);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao recuperar item de compra: $e');
    }
  }
}

class GetItemsByPurchaseIdUseCase {
  final IPurchaseItemRepository _repository;

  GetItemsByPurchaseIdUseCase(this._repository);

  Future<List<PurchaseItemEntity>> call(int purchaseId) async {
    try {
      if (purchaseId <= 0) {
        throw ArgumentError('ID da compra inválido');
      }
      return await _repository.getItemsByPurchaseId(purchaseId);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao recuperar itens de compra: $e');
    }
  }
}

class GetItemsByProductIdUseCase {
  final IPurchaseItemRepository _repository;

  GetItemsByProductIdUseCase(this._repository);

  Future<List<PurchaseItemEntity>> call(int productId) async {
    try {
      if (productId <= 0) {
        throw ArgumentError('ID do produto inválido');
      }
      return await _repository.getItemsByProductId(productId);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao recuperar itens de compra: $e');
    }
  }
}

class UpdatePurchaseItemUseCase {
  final IPurchaseItemRepository _repository;

  UpdatePurchaseItemUseCase(this._repository);

  Future<PurchaseItemEntity> call(PurchaseItemEntity item) async {
    try {
      if (item.id == null || item.id! <= 0) {
        throw ArgumentError('ID do item de compra inválido para atualização');
      }
      if (!item.isValid) {
        throw ArgumentError('Dados do item de compra inválidos');
      }
      return await _repository.updatePurchaseItem(item);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao atualizar item de compra: $e');
    }
  }
}

class DeletePurchaseItemByIdUseCase {
  final IPurchaseItemRepository _repository;

  DeletePurchaseItemByIdUseCase(this._repository);

  Future<void> call(int id) async {
    try {
      if (id <= 0) {
        throw ArgumentError('ID do item de compra inválido');
      }
      await _repository.deletePurchaseItem(id);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao deletar item de compra: $e');
    }
  }
}
