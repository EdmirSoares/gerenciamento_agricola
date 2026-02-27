import '../entities/area_entity.dart';
import '../repositories/area_repository.dart';

class CreateAreaUseCase {
  final IAreaRepository _repository;

  CreateAreaUseCase(this._repository);

  Future<AreaEntity> call(AreaEntity area) async {
    try {
      if (!area.isValid) {
        throw ArgumentError('Dados da área são inválidos');
      }
      return await _repository.saveArea(area);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao criar área: $e');
    }
  }
}

class GetAllAreasUseCase {
  final IAreaRepository _repository;

  GetAllAreasUseCase(this._repository);

  Future<List<AreaEntity>> call() async {
    try {
      return await _repository.getAllAreas();
    } catch (e) {
      throw Exception('Falha ao recuperar áreas: $e');
    }
  }
}

class GetAreaByIdUseCase {
  final IAreaRepository _repository;

  GetAreaByIdUseCase(this._repository);

  Future<AreaEntity?> call(int id) async {
    try {
      if (id <= 0) {
        throw ArgumentError('ID da área inválido');
      }
      return await _repository.getAreaById(id);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao recuperar área: $e');
    }
  }
}

class SearchAreasByNameUseCase {
  final IAreaRepository _repository;

  SearchAreasByNameUseCase(this._repository);

  Future<List<AreaEntity>> call(String name) async {
    try {
      if (name.trim().isEmpty) {
        throw ArgumentError('O nome da área não pode estar vazio');
      }
      return await _repository.searchAreasByName(name);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao buscar áreas: $e');
    }
  }
}

class UpdateAreaUseCase {
  final IAreaRepository _repository;

  UpdateAreaUseCase(this._repository);

  Future<AreaEntity> call(AreaEntity area) async {
    try {
      if (area.id == null || area.id! <= 0) {
        throw ArgumentError('Área deve ter um ID válido para atualização');
      }
      if (!area.isValid) {
        throw ArgumentError('Dados da área são inválidos');
      }
      return await _repository.updateArea(area);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao atualizar área: $e');
    }
  }
}

class DeleteAreaByIdUseCase {
  final IAreaRepository _repository;

  DeleteAreaByIdUseCase(this._repository);

  Future<void> call(int id) async {
    try {
      if (id <= 0) {
        throw ArgumentError('ID da área inválido');
      }
      await _repository.deleteArea(id);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Falha ao deletar área: $e');
    }
  }
}
