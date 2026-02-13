import 'package:gerenciamento_agricola/domain/entities/category_entity.dart';
import 'package:gerenciamento_agricola/domain/repositories/category_repository.dart';

class CreateCategoryUseCase {
  final ICategoryRepository _repository;

  CreateCategoryUseCase(this._repository);

  Future<void> call(String name) async {
    final category = CategoryEntity.create(name: name);
    await _repository.saveCategory(category);
  }
}

class UpdateCategoryUseCase {
  final ICategoryRepository _repository;

  UpdateCategoryUseCase(this._repository);

  Future<void> call(CategoryEntity category) async {
    await _repository.updateCategory(category);
  }
}

class GetAllCategoriesUseCase {
  final ICategoryRepository _repository;

  GetAllCategoriesUseCase(this._repository);

  Future<List<CategoryEntity>> call() async {
    return await _repository.getAllCategories();
  }
}

class GetCategoryByIdUseCase {
  final ICategoryRepository _repository;

  GetCategoryByIdUseCase(this._repository);

  Future<CategoryEntity?> call(int id) async {
    return await _repository.getCategoryById(id);
  }
}

class DeleteCategoryByIdUseCase {
  final ICategoryRepository _repository;

  DeleteCategoryByIdUseCase(this._repository);

  Future<void> call(int id) async {
    await _repository.deleteCategory(id);
  }
}
