import 'package:gerenciamento_agricola/domain/entities/category_entity.dart';
import 'package:gerenciamento_agricola/domain/repositories/category_repository.dart';

class CategoryHasProductsException implements Exception {
  final int productCount;
  CategoryHasProductsException(this.productCount);

  @override
  String toString() =>
      'A categoria possui $productCount produto(s) vinculado(s) e não pode ser excluída.';
}

class CreateCategoryUseCase {
  final ICategoryRepository _repository;

  CreateCategoryUseCase(this._repository);

  Future<void> call(String name) async {
    try {
      final category = CategoryEntity.create(name: name);
      await _repository.saveCategory(category);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Erro ao criar categoria: ${e.toString()}');
    }
  }
}

class UpdateCategoryUseCase {
  final ICategoryRepository _repository;

  UpdateCategoryUseCase(this._repository);

  Future<void> call(CategoryEntity category) async {
    if (category.id == null) {
      throw ArgumentError('Não é possível atualizar categoria sem ID');
    }

    try {
      await _repository.updateCategory(category);
    } catch (e) {
      throw Exception('Erro ao atualizar categoria: ${e.toString()}');
    }
  }
}

class DeleteCategoryByIdUseCase {
  final ICategoryRepository _repository;

  DeleteCategoryByIdUseCase(this._repository);

  Future<void> call(int id) async {
    if (id <= 0) {
      throw ArgumentError('ID da categoria deve ser maior que zero');
    }

    try {
      final count = await _repository.countProductsByCategory(id);
      if (count > 0) {
        throw CategoryHasProductsException(count);
      }
      await _repository.deleteCategory(id);
    } on ArgumentError {
      rethrow;
    } on CategoryHasProductsException {
      rethrow;
    } catch (e) {
      throw Exception('Erro ao deletar categoria: ${e.toString()}');
    }
  }
}

class GetAllCategoriesUseCase {
  final ICategoryRepository _repository;

  GetAllCategoriesUseCase(this._repository);

  Future<List<CategoryEntity>> call() async {
    try {
      return await _repository.getAllCategories();
    } catch (e) {
      throw Exception('Erro ao buscar categorias: ${e.toString()}');
    }
  }
}

class GetCategoryByIdUseCase {
  final ICategoryRepository _repository;

  GetCategoryByIdUseCase(this._repository);

  Future<CategoryEntity?> call(int id) async {
    if (id <= 0) {
      throw ArgumentError('ID da categoria deve ser maior que zero');
    }

    try {
      return await _repository.getCategoryById(id);
    } catch (e) {
      throw Exception('Erro ao buscar categoria por ID: ${e.toString()}');
    }
  }
}

class CountProductsByCategoryUseCase {
  final ICategoryRepository _repository;

  CountProductsByCategoryUseCase(this._repository);

  Future<int> call(int categoryId) async {
    if (categoryId <= 0) {
      throw ArgumentError('ID da categoria deve ser maior que zero');
    }
    return _repository.countProductsByCategory(categoryId);
  }
}
