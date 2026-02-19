import 'package:gerenciamento_agricola/domain/entities/stock_entity.dart';
import 'package:gerenciamento_agricola/domain/repositories/stock_repository.dart';

class AddStockUseCase {
  final IStockRepository _repository;

  AddStockUseCase(this._repository);

  Future<void> call(
    int productId,
    double quantity,
    double? minimumStock,
    String? location,
    String? lotNumber,
    DateTime? expirationDate,
  ) async {
    final stock = StockEntity.create(
      productId: productId,
      quantity: quantity,
      minimumStock: minimumStock,
      location: location,
      lotNumber: lotNumber,
      expirationDate: expirationDate,
    );
    await _repository.addStock(stock);
  }
}

class UpdateStockUseCase {
  final IStockRepository _repository;

  UpdateStockUseCase(this._repository);

  Future<void> call(StockEntity stock) async {
    await _repository.updateStock(stock);
  }
}

class GetAllStockUseCase {
  final IStockRepository _repository;

  GetAllStockUseCase(this._repository);

  Future<List<StockEntity>> call() async {
    return await _repository.getAllStock();
  }
}

class GetStockByIdUseCase {
  final IStockRepository _repository;

  GetStockByIdUseCase(this._repository);

  Future<StockEntity?> call(int id) async {
    return await _repository.getStockById(id);
  }
}

class GetStockByProductIdUseCase {
  final IStockRepository _repository;

  GetStockByProductIdUseCase(this._repository);

  Future<List<StockEntity>> call(int productId) async {
    return await _repository.getStockByProductId(productId);
  }
}

class GetStockBelowQuantityUseCase {
  final IStockRepository _repository;

  GetStockBelowQuantityUseCase(this._repository);

  Future<List<StockEntity>> call(double threshold) async {
    if (threshold < 0) {
      throw ArgumentError('Quantidade limite não pode ser negativa');
    }
    return await _repository.getStockBelowQuantity(threshold);
  }
}

class GetStockExpiringWithinUseCase {
  final IStockRepository _repository;

  GetStockExpiringWithinUseCase(this._repository);

  Future<List<StockEntity>> call(int days) async {
    if (days < 0) {
      throw ArgumentError('Número de dias não pode ser negativo');
    }
    return await _repository.getStockExpiringWithin(days);
  }
}

class SearchStockByProductNameUseCase {
  final IStockRepository _repository;

  SearchStockByProductNameUseCase(this._repository);

  Future<List<StockEntity>> call(String productName) async {
    final trimmedName = productName.trim();
    if (trimmedName.isEmpty) {
      throw ArgumentError('Nome do produto não pode ser vazio');
    }
    return await _repository.searchStockByProductName(trimmedName);
  }
}

class DeleteStockByIdUseCase {
  final IStockRepository _repository;

  DeleteStockByIdUseCase(this._repository);

  Future<void> call(int id) async {
    if (id <= 0) {
      throw ArgumentError('ID do estoque deve ser maior que zero');
    }
    await _repository.deleteStockById(id);
  }
}

class DeleteExpiredStockUseCase {
  final IStockRepository _repository;

  DeleteExpiredStockUseCase(this._repository);

  Future<void> call() async {
    await _repository.deleteExpiredStock();
  }
}

class DeleteStockBelowQuantityUseCase {
  final IStockRepository _repository;

  DeleteStockBelowQuantityUseCase(this._repository);

  Future<void> call(double threshold) async {
    if (threshold < 0) {
      throw ArgumentError('Quantidade limite não pode ser negativa');
    }
    await _repository.deleteStockBelowQuantity(threshold);
  }
}
