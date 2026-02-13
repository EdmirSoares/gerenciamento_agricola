import 'package:drift/drift.dart';
import 'package:gerenciamento_agricola/data/database/app_database.dart';
import 'package:gerenciamento_agricola/domain/entities/category_entity.dart';
import 'package:gerenciamento_agricola/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements ICategoryRepository {
  final AppDatabase _db;

  CategoryRepositoryImpl(this._db);

  @override
  Future<void> saveCategory(CategoryEntity category) async {
    final companion = FarmCategoriesCompanion(
      name: Value<String>(category.name),
      createdAt: Value<DateTime>(category.createdAt),
      updatedAt: Value<DateTime>(category.updatedAt),
      isDeleted: Value<bool>(category.isDeleted),
    );

    await _db.into(_db.farmCategories).insert(companion);
  }

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    final results = await _db.select(_db.farmCategories).get();

    return results.map((row) {
      return CategoryEntity(
        id: row.id,
        name: row.name,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
        isDeleted: row.isDeleted,
      );
    }).toList();
  }

  @override
  Future<CategoryEntity?> getCategoryById(int id) async {
    final query = _db.select(_db.farmCategories)
      ..where((tbl) => tbl.id.equals(id));

    final result = await query.getSingleOrNull();

    if (result == null) return null;

    return CategoryEntity(
      id: result.id,
      name: result.name,
      createdAt: result.createdAt,
      updatedAt: result.updatedAt,
      isDeleted: result.isDeleted,
    );
  }

  @override
  Future<void> updateCategory(CategoryEntity category) async {
    if (category.id == null) {
      throw Exception('Não é possível atualizar categoria sem ID');
    }

    final companion = FarmCategoriesCompanion(
      id: Value(category.id!),
      name: Value(category.name),
      updatedAt: Value(DateTime.now()),
    );

    await _db.update(_db.farmCategories).replace(companion);
  }

  @override
  Future<void> deleteCategory(int id) async {
    await (_db.delete(
      _db.farmCategories,
    )..where((tbl) => tbl.id.equals(id))).go();
  }
}
