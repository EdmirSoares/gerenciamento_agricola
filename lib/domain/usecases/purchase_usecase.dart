import 'package:gerenciamento_agricola/domain/entities/purchase_entity.dart';
import 'package:gerenciamento_agricola/domain/repositories/purchase_repository.dart';

class CreatePurchaseUseCase {
  final IPurchaseRepository _repository;

  CreatePurchaseUseCase(this._repository);

  Future<void> call({
    required int supplierId,
    required DateTime purchaseDate,
    required int totalValueInCents,
    DateTime? dueDate,
    bool isPaid = false,
    DateTime? paymentDate,
    String? description,
  }) async {
    try {
      final purchase = PurchaseEntity.create(
        supplierId: supplierId,
        purchaseDate: purchaseDate,
        totalValueInCents: totalValueInCents,
        dueDate: dueDate,
        isPaid: isPaid,
        paymentDate: paymentDate,
        description: description,
      );

      await _repository.savePurchase(purchase);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Erro ao criar compra: $e');
    }
  }
}

class UpdatePurchaseUseCase {
  final IPurchaseRepository _repository;

  UpdatePurchaseUseCase(this._repository);

  Future<void> call(PurchaseEntity purchase) async {
    try {
      if (purchase.id == null) {
        throw ArgumentError('Compra deve ter um ID para ser atualizada');
      }

      await _repository.updatePurchase(purchase);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Erro ao atualizar compra: $e');
    }
  }
}

class DeletePurchaseByIdUseCase {
  final IPurchaseRepository _repository;

  DeletePurchaseByIdUseCase(this._repository);

  Future<void> call(int id) async {
    try {
      if (id <= 0) {
        throw ArgumentError('ID da compra deve ser maior que zero');
      }

      await _repository.deletePurchase(id);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Erro ao deletar compra: $e');
    }
  }
}

class GetAllPurchasesUseCase {
  final IPurchaseRepository _repository;

  GetAllPurchasesUseCase(this._repository);

  Future<List<PurchaseEntity>> call() async {
    try {
      return await _repository.getAllPurchases();
    } catch (e) {
      throw Exception('Erro ao buscar compras: $e');
    }
  }
}

class GetPurchaseByIdUseCase {
  final IPurchaseRepository _repository;

  GetPurchaseByIdUseCase(this._repository);

  Future<PurchaseEntity?> call(int id) async {
    try {
      if (id <= 0) {
        throw ArgumentError('ID da compra deve ser maior que zero');
      }

      return await _repository.getPurchaseById(id);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Erro ao buscar compra por ID: $e');
    }
  }
}

class GetPurchasesBySupplierUseCase {
  final IPurchaseRepository _repository;

  GetPurchasesBySupplierUseCase(this._repository);

  Future<List<PurchaseEntity>> call(int supplierId) async {
    try {
      if (supplierId <= 0) {
        throw ArgumentError('ID do fornecedor deve ser maior que zero');
      }

      return await _repository.getPurchasesBySupplier(supplierId);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Erro ao buscar compras do fornecedor: $e');
    }
  }
}

class GetPendingPurchasesUseCase {
  final IPurchaseRepository _repository;

  GetPendingPurchasesUseCase(this._repository);

  Future<List<PurchaseEntity>> call() async {
    try {
      return await _repository.getPendingPurchases();
    } catch (e) {
      throw Exception('Erro ao buscar compras pendentes: $e');
    }
  }
}

class GetOverduePurchasesUseCase {
  final IPurchaseRepository _repository;

  GetOverduePurchasesUseCase(this._repository);

  Future<List<PurchaseEntity>> call() async {
    try {
      return await _repository.getOverduePurchases();
    } catch (e) {
      throw Exception('Erro ao buscar compras vencidas: $e');
    }
  }
}

class GetPaidPurchasesUseCase {
  final IPurchaseRepository _repository;

  GetPaidPurchasesUseCase(this._repository);

  Future<List<PurchaseEntity>> call() async {
    try {
      return await _repository.getPaidPurchases();
    } catch (e) {
      throw Exception('Erro ao buscar compras pagas: $e');
    }
  }
}

class MarkPurchaseAsPaidUseCase {
  final IPurchaseRepository _repository;

  MarkPurchaseAsPaidUseCase(this._repository);

  Future<void> call(int id, DateTime paymentDate) async {
    try {
      if (id <= 0) {
        throw ArgumentError('ID da compra deve ser maior que zero');
      }

      final now = DateTime.now();
      if (paymentDate.isAfter(now)) {
        throw ArgumentError('Data de pagamento não pode ser no futuro');
      }

      await _repository.markAsPaid(id, paymentDate);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Erro ao marcar compra como paga: $e');
    }
  }
}
