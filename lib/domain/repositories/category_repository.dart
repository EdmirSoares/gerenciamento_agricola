import 'package:gerenciamento_agricola/domain/entities/category_entity.dart';

abstract class ICategoryRepository {
  Future<void> saveCategory(CategoryEntity category);
  Future<List<CategoryEntity>> getAllCategories();
  Future<CategoryEntity?> getCategoryById(int id);
  Future<void> updateCategory(CategoryEntity category);
  Future<void> deleteCategory(int id);
}
