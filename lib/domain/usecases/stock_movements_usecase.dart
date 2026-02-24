import 'package:gerenciamento_agricola/data/database/tables.dart';
import 'package:gerenciamento_agricola/domain/entities/stock_movement_with_product.dart';
import 'package:gerenciamento_agricola/domain/entities/stock_movements_entity.dart';
import 'package:gerenciamento_agricola/domain/repositories/stock_movements_repository.dart';

class AddStockMovementUseCase {
  final IStockMovementsRepository _repository;

  AddStockMovementUseCase(this._repository);

  Future<void> call(
    int productId,
    double quantity,
    StockMovementType type,
    int? unitCostInCents,
    String? referenceType,
  ) async {
    if (productId <= 0) {
      throw ArgumentError('ID do produto deve ser maior que zero');
    }
    
    if (quantity <= 0) {
      throw ArgumentError('Quantidade deve ser maior que zero');
    }
    
    if (unitCostInCents != null && unitCostInCents < 0) {
      throw ArgumentError('Custo unitário não pode ser negativo');
    }

    try {
      final stockMovement = StockMovementEntity.create(
        productId: productId,
        type: type,
        quantity: quantity,
        unitCostInCents: unitCostInCents,
        referenceType: referenceType,
      );
      
      await _repository.addStockMovement(stockMovement);
    } catch (e) {
      throw Exception('Erro ao adicionar movimentação de estoque: ${e.toString()}');
    }
  }
}

class UpdateStockMovementUseCase {
  final IStockMovementsRepository _repository;

  UpdateStockMovementUseCase(this._repository);

  Future<void> call(StockMovementEntity stockMovement) async {
    if (stockMovement.id == null) {
      throw ArgumentError('ID da movimentação é obrigatório para atualização');
    }
    
    if (stockMovement.quantity <= 0) {
      throw ArgumentError('Quantidade deve ser maior que zero');
    }
    
    if (stockMovement.unitCostInCents != null && 
        stockMovement.unitCostInCents! < 0) {
      throw ArgumentError('Custo unitário não pode ser negativo');
    }

    try {
      await _repository.updateStockMovement(stockMovement);
    } catch (e) {
      throw Exception('Erro ao atualizar movimentação: ${e.toString()}');
    }
  }
}

class DeleteStockMovementsUseCase {
  final IStockMovementsRepository _repository;

  DeleteStockMovementsUseCase(this._repository);

  Future<void> call(List<int> ids) async {
    if (ids.isEmpty) {
      throw ArgumentError('Lista de IDs não pode estar vazia');
    }
    
    // Valida que todos os IDs são válidos
    if (ids.any((id) => id <= 0)) {
      throw ArgumentError('Todos os IDs devem ser maiores que zero');
    }

    try {
      await _repository.deleteStockMovements(ids);
    } catch (e) {
      throw Exception('Erro ao deletar movimentações: ${e.toString()}');
    }
  }
}

class DeleteAllStockMovementsUseCase {
  final IStockMovementsRepository _repository;

  DeleteAllStockMovementsUseCase(this._repository);

  Future<void> call() async {
    try {
      await _repository.deleteAllStockMovements();
    } catch (e) {
      throw Exception('Erro ao deletar todas as movimentações: ${e.toString()}');
    }
  }
}

class GetStockMovementByIdUseCase {
  final IStockMovementsRepository _repository;

  GetStockMovementByIdUseCase(this._repository);

  Future<StockMovementEntity?> call(int id) async {
    if (id <= 0) {
      throw ArgumentError('ID deve ser maior que zero');
    }

    try {
      return await _repository.getStockMovementById(id);
    } catch (e) {
      throw Exception('Erro ao buscar movimentação: ${e.toString()}');
    }
  }
}

class GetAllStockMovementsUseCase {
  final IStockMovementsRepository _repository;

  GetAllStockMovementsUseCase(this._repository);

  Future<List<StockMovementWithProduct>> call() async {
    try {
      return await _repository.getAllStockMovements();
    } catch (e) {
      throw Exception('Erro ao listar movimentações: ${e.toString()}');
    }
  }
}

class GetMovementsByProductIdUseCase {
  final IStockMovementsRepository _repository;

  GetMovementsByProductIdUseCase(this._repository);

  Future<List<StockMovementWithProduct>> call(int productId) async {
    if (productId <= 0) {
      throw ArgumentError('ID do produto deve ser maior que zero');
    }

    try {
      return await _repository.getMovementsByProductId(productId);
    } catch (e) {
      throw Exception('Erro ao buscar movimentações do produto: ${e.toString()}');
    }
  }
}

class GetMovementsByTypeUseCase {
  final IStockMovementsRepository _repository;

  GetMovementsByTypeUseCase(this._repository);

  Future<List<StockMovementWithProduct>> call(StockMovementType type) async {
    try {
      return await _repository.getMovementsByType(type);
    } catch (e) {
      throw Exception('Erro ao buscar movimentações por tipo: ${e.toString()}');
    }
  }
}

class GetMovementsByDateRangeUseCase {
  final IStockMovementsRepository _repository;

  GetMovementsByDateRangeUseCase(this._repository);

  Future<List<StockMovementWithProduct>> call(
    DateTime startDate,
    DateTime endDate,
  ) async {
    if (startDate.isAfter(endDate)) {
      throw ArgumentError(
        'Data inicial (${startDate.toIso8601String()}) não pode ser posterior à data final (${endDate.toIso8601String()})',
      );
    }

    try {
      return await _repository.getMovementsByDateRange(startDate, endDate);
    } catch (e) {
      throw Exception('Erro ao buscar movimentações por período: ${e.toString()}');
    }
  }
}

class SearchMovementsByProductNameUseCase {
  final IStockMovementsRepository _repository;

  SearchMovementsByProductNameUseCase(this._repository);

  Future<List<StockMovementWithProduct>> call(String productName) async {
    final trimmedName = productName.trim();
    
    if (trimmedName.isEmpty) {
      throw ArgumentError('Nome do produto não pode estar vazio');
    }

    try {
      return await _repository.searchMovementsByProductName(trimmedName);
    } catch (e) {
      throw Exception('Erro ao buscar movimentações por nome: ${e.toString()}');
    }
  }
}

class GetMovementsByCategoryUseCase {
  final IStockMovementsRepository _repository;

  GetMovementsByCategoryUseCase(this._repository);

  Future<List<StockMovementWithProduct>> call(int categoryId) async {
    if (categoryId <= 0) {
      throw ArgumentError('ID da categoria deve ser maior que zero');
    }

    try {
      return await _repository.getMovementsByCategory(categoryId);
    } catch (e) {
      throw Exception('Erro ao buscar movimentações por categoria: ${e.toString()}');
    }
  }
}
