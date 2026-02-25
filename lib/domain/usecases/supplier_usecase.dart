import 'package:gerenciamento_agricola/domain/entities/supplier_entity.dart';
import 'package:gerenciamento_agricola/domain/repositories/supplier_repository.dart';

class CreateSupplierUseCase {
  final ISupplierRepository _repository;

  CreateSupplierUseCase(this._repository);

  Future<void> call(String name, String? contactInfo) async {
    try {
      final supplier = SupplierEntity.create(
        name: name,
        contactInfo: contactInfo,
      );
      await _repository.saveSupplier(supplier);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Erro ao criar fornecedor: ${e.toString()}');
    }
  }
}

class UpdateSupplierUseCase {
  final ISupplierRepository _repository;

  UpdateSupplierUseCase(this._repository);

  Future<void> call(SupplierEntity supplier) async {
    if (supplier.id == null) {
      throw ArgumentError('Não é possível atualizar fornecedor sem ID');
    }

    try {
      await _repository.updateSupplier(supplier);
    } catch (e) {
      throw Exception('Erro ao atualizar fornecedor: ${e.toString()}');
    }
  }
}

class DeleteSupplierByIdUseCase {
  final ISupplierRepository _repository;

  DeleteSupplierByIdUseCase(this._repository);

  Future<void> call(int id) async {
    if (id <= 0) {
      throw ArgumentError('ID do fornecedor deve ser maior que zero');
    }

    try {
      await _repository.deleteSupplier(id);
    } catch (e) {
      throw Exception('Erro ao deletar fornecedor: ${e.toString()}');
    }
  }
}

class GetAllSuppliersUseCase {
  final ISupplierRepository _repository;

  GetAllSuppliersUseCase(this._repository);

  Future<List<SupplierEntity>> call() async {
    try {
      return await _repository.getAllSuppliers();
    } catch (e) {
      throw Exception('Erro ao buscar fornecedores: ${e.toString()}');
    }
  }
}

class GetSupplierByIdUseCase {
  final ISupplierRepository _repository;

  GetSupplierByIdUseCase(this._repository);

  Future<SupplierEntity?> call(int id) async {
    if (id <= 0) {
      throw ArgumentError('ID do fornecedor deve ser maior que zero');
    }

    try {
      return await _repository.getSupplierById(id);
    } catch (e) {
      throw Exception('Erro ao buscar fornecedor por ID: ${e.toString()}');
    }
  }
}

class SearchSuppliersByNameUseCase {
  final ISupplierRepository _repository;

  SearchSuppliersByNameUseCase(this._repository);

  Future<List<SupplierEntity>> call(String name) async {
    if (name.trim().length < 2) {
      throw ArgumentError('Nome deve ter pelo menos 2 caracteres para busca');
    }

    try {
      return await _repository.searchSuppliersByName(name.trim());
    } catch (e) {
      throw Exception('Erro ao buscar fornecedores por nome: ${e.toString()}');
    }
  }
}
