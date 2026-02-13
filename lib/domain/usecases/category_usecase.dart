// lib/domain/usecases/category_usecase.dart
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

class GetAllCategoriesUseCase {
  final ICategoryRepository _repository;
  
  GetAllCategoriesUseCase(this._repository);
  
  Future<List<CategoryEntity>> call() async {
    return await _repository.getAllCategories();
  }
}