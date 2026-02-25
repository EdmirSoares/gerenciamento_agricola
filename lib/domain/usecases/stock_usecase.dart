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
    try {
      final stock = StockEntity.create(
        productId: productId,
        quantity: quantity,
        minimumStock: minimumStock,
        location: location,
        lotNumber: lotNumber,
        expirationDate: expirationDate,
      );
      await _repository.addStock(stock);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Erro ao adicionar estoque: ${e.toString()}');
    }
  }
}

class UpdateStockUseCase {
  final IStockRepository _repository;

  UpdateStockUseCase(this._repository);

  Future<void> call(StockEntity stock) async {
    if (stock.id == null) {
      throw ArgumentError('ID do estoque é obrigatório para atualização');
    }

    try {
      await _repository.updateStock(stock);
    } catch (e) {
      throw Exception('Erro ao atualizar estoque: ${e.toString()}');
    }
  }
}

class GetAllStockUseCase {
  final IStockRepository _repository;

  GetAllStockUseCase(this._repository);

  Future<List<StockEntity>> call() async {
    try {
      return await _repository.getAllStock();
    } catch (e) {
      throw Exception('Erro ao carregar estoque: ${e.toString()}');
    }
  }
}

class GetStockByIdUseCase {
  final IStockRepository _repository;

  GetStockByIdUseCase(this._repository);

  Future<StockEntity?> call(int id) async {
    if (id <= 0) {
      throw ArgumentError('ID deve ser maior que zero');
    }

    try {
      return await _repository.getStockById(id);
    } catch (e) {
      throw Exception('Erro ao buscar estoque: ${e.toString()}');
    }
  }
}

class GetStockByProductIdUseCase {
  final IStockRepository _repository;

  GetStockByProductIdUseCase(this._repository);

  Future<List<StockEntity>> call(int productId) async {
    if (productId <= 0) {
      throw ArgumentError('ID do produto deve ser maior que zero');
    }

    try {
      return await _repository.getStockByProductId(productId);
    } catch (e) {
      throw Exception('Erro ao buscar estoque do produto: ${e.toString()}');
    }
  }
}

class GetStockBelowQuantityUseCase {
  final IStockRepository _repository;

  GetStockBelowQuantityUseCase(this._repository);

  Future<List<StockEntity>> call(double threshold) async {
    if (threshold < 0) {
      throw ArgumentError('Quantidade limite não pode ser negativa');
    }

    try {
      return await _repository.getStockBelowQuantity(threshold);
    } catch (e) {
      throw Exception('Erro ao buscar estoque baixo: ${e.toString()}');
    }
  }
}

class GetStockExpiringWithinUseCase {
  final IStockRepository _repository;

  GetStockExpiringWithinUseCase(this._repository);

  Future<List<StockEntity>> call(int days) async {
    if (days < 0) {
      throw ArgumentError('Número de dias não pode ser negativo');
    }

    try {
      return await _repository.getStockExpiringWithin(days);
    } catch (e) {
      throw Exception(
        'Erro ao buscar produtos próximos da validade: ${e.toString()}',
      );
    }
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

    if (trimmedName.length < 2) {
      throw ArgumentError('Nome do produto deve ter pelo menos 2 caracteres');
    }

    try {
      return await _repository.searchStockByProductName(trimmedName);
    } catch (e) {
      throw Exception('Erro ao buscar estoque por nome: ${e.toString()}');
    }
  }
}

class DeleteStockByIdUseCase {
  final IStockRepository _repository;

  DeleteStockByIdUseCase(this._repository);

  Future<void> call(int id) async {
    if (id <= 0) {
      throw ArgumentError('ID do estoque deve ser maior que zero');
    }

    try {
      await _repository.deleteStockById(id);
    } catch (e) {
      throw Exception('Erro ao deletar estoque: ${e.toString()}');
    }
  }
}

class DeleteExpiredStockUseCase {
  final IStockRepository _repository;

  DeleteExpiredStockUseCase(this._repository);

  Future<void> call() async {
    try {
      await _repository.deleteExpiredStock();
    } catch (e) {
      throw Exception('Erro ao deletar estoque vencido: ${e.toString()}');
    }
  }
}

class DeleteStockBelowQuantityUseCase {
  final IStockRepository _repository;

  DeleteStockBelowQuantityUseCase(this._repository);

  Future<void> call(double threshold) async {
    if (threshold < 0) {
      throw ArgumentError('Quantidade limite não pode ser negativa');
    }

    try {
      await _repository.deleteStockBelowQuantity(threshold);
    } catch (e) {
      throw Exception('Erro ao deletar estoque baixo: ${e.toString()}');
    }
  }
}
