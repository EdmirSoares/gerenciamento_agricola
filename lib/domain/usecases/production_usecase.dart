import '../entities/production_entity.dart';
import '../repositories/production_repository.dart';

class CreateProductionUseCase {
  final IProductionRepository _repository;

  CreateProductionUseCase(this._repository);

  Future<ProductionEntity> call(ProductionEntity production) async {
    try {
      if (!production.isValid) {
        throw ArgumentError('Dados de produção inválidos');
      }
      return await _repository.saveProduction(production);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao criar produção: $e');
    }
  }
}

class GetAllProductionsUseCase {
  final IProductionRepository _repository;

  GetAllProductionsUseCase(this._repository);

  Future<List<ProductionEntity>> call() async {
    try {
      return await _repository.getAllProductions();
    } catch (e) {
      throw Exception('Falha ao recuperar produções: $e');
    }
  }
}

class GetProductionByIdUseCase {
  final IProductionRepository _repository;

  GetProductionByIdUseCase(this._repository);

  Future<ProductionEntity?> call(int id) async {
    try {
      if (id <= 0) {
        throw ArgumentError('Código de produção inválido ou não encontrado');
      }
      return await _repository.getProductionById(id);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao recuperar produção: $e');
    }
  }
}

class GetProductionsByProductIdUseCase {
  final IProductionRepository _repository;

  GetProductionsByProductIdUseCase(this._repository);

  Future<List<ProductionEntity>> call(int productId) async {
    try {
      if (productId <= 0) {
        throw ArgumentError('Código do produto inválido ou não encontrado');
      }
      return await _repository.getProductionsByProductId(productId);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao recuperar produções do produto: $e');
    }
  }
}

class GetProductionsByAreaIdUseCase {
  final IProductionRepository _repository;

  GetProductionsByAreaIdUseCase(this._repository);

  Future<List<ProductionEntity>> call(int areaId) async {
    try {
      if (areaId <= 0) {
        throw ArgumentError('Código da área de produção inválido ou não encontrado');
      }
      return await _repository.getProductionsByAreaId(areaId);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao recuperar produções da área de produção: $e');
    }
  }
}

class GetProductionsByDateRangeUseCase {
  final IProductionRepository _repository;

  GetProductionsByDateRangeUseCase(this._repository);

  Future<List<ProductionEntity>> call(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      if (endDate.isBefore(startDate)) {
        throw ArgumentError('Data final deve ser posterior à data inicial');
      }
      return await _repository.getProductionsByDateRange(startDate, endDate);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao recuperar produções no intervalo de datas: $e');
    }
  }
}

class GetProfitableProductionsUseCase {
  final IProductionRepository _repository;

  GetProfitableProductionsUseCase(this._repository);

  Future<List<ProductionEntity>> call() async {
    try {
      return await _repository.getProfitableProductions();
    } catch (e) {
      throw Exception('Falha ao recuperar produções lucrativas: $e');
    }
  }
}

class UpdateProductionUseCase {
  final IProductionRepository _repository;

  UpdateProductionUseCase(this._repository);

  Future<ProductionEntity> call(ProductionEntity production) async {
    try {
      if (production.id == null || production.id! <= 0) {
        throw ArgumentError('Código de produção inválido ou não encontrado');
      }
      if (!production.isValid) {
        throw ArgumentError('Dados de produção inválidos');
      }
      return await _repository.updateProduction(production);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao atualizar produção: $e');
    }
  }
}

class DeleteProductionByIdUseCase {
  final IProductionRepository _repository;

  DeleteProductionByIdUseCase(this._repository);

  Future<void> call(int id) async {
    try {
      if (id <= 0) {
        throw ArgumentError('Código de produção inválido ou não encontrado');
      }
      await _repository.deleteProduction(id);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao excluir produção: $e');
    }
  }
}
