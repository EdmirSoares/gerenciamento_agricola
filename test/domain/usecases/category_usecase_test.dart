import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciamento_agricola/data/database/app_database.dart';
import 'package:gerenciamento_agricola/data/repositories/category_repository_impl.dart';
import 'package:gerenciamento_agricola/domain/usecases/category_usecase.dart';
import 'package:drift/native.dart';

void main() {
  late AppDatabase database;
  late CategoryRepositoryImpl repository;
  late CreateCategoryUseCase createUseCase;
  late GetAllCategoriesUseCase getAllUseCase;
  late GetCategoryByIdUseCase getByIdUseCase;
  late UpdateCategoryUseCase updateUseCase;
  late DeleteCategoryByIdUseCase deleteUseCase;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory(logStatements: false));
    repository = CategoryRepositoryImpl(database);
    
    createUseCase = CreateCategoryUseCase(repository);
    getAllUseCase = GetAllCategoriesUseCase(repository);
    getByIdUseCase = GetCategoryByIdUseCase(repository);
    updateUseCase = UpdateCategoryUseCase(repository);
    deleteUseCase = DeleteCategoryByIdUseCase(repository);
  });

  tearDown(() async {
    await database.close();
  });

  group('Category UseCases', () {
    test('Deve criar uma categoria com sucesso', () async {

      const categoryName = 'Frutas';

      await createUseCase(categoryName);

      final categories = await getAllUseCase();
      expect(categories.length, 1);
      expect(categories.first.name, categoryName);
      expect(categories.first.id, isNotNull);
      expect(categories.first.isDeleted, false);
    });

    test('Deve buscar todas as categorias', () async {

      await createUseCase('Frutas');
      await createUseCase('Verduras');
      await createUseCase('Legumes');

      final categories = await getAllUseCase();

      expect(categories.length, 3);
      expect(categories[0].name, 'Frutas');
      expect(categories[1].name, 'Verduras');
      expect(categories[2].name, 'Legumes');
    });

    test('Deve buscar uma categoria por ID', () async {

      await createUseCase('Frutas');
      final allCategories = await getAllUseCase();
      final categoryId = allCategories.first.id!;

      final category = await getByIdUseCase(categoryId);

      expect(category, isNotNull);
      expect(category!.id, categoryId);
      expect(category.name, 'Frutas');
    });

    test('Deve retornar null ao buscar categoria inexistente', () async {

      final category = await getByIdUseCase(999);

      expect(category, isNull);
    });

    test('Deve atualizar uma categoria com sucesso', () async {

      await createUseCase('Frutas');
      final allCategories = await getAllUseCase();
      final category = allCategories.first;

      final updatedCategory = category.copyWith(
        name: 'Frutas Tropicais',
        updatedAt: DateTime.now(),
      );

      await updateUseCase(updatedCategory);

      final result = await getByIdUseCase(category.id!);
      expect(result, isNotNull);
      expect(result!.name, 'Frutas Tropicais');
      expect(result.id, category.id);
    });

    test('Deve deletar uma categoria com sucesso', () async {

      await createUseCase('Frutas');
      final allCategories = await getAllUseCase();
      final categoryId = allCategories.first.id!;

      await deleteUseCase(categoryId);

      final categories = await getAllUseCase();
      expect(categories.length, 0);
      
      final deletedCategory = await getByIdUseCase(categoryId);
      expect(deletedCategory, isNull);
    });

    test('Deve criar múltiplas categorias e deletar apenas uma', () async {

      await createUseCase('Frutas');
      await createUseCase('Verduras');
      await createUseCase('Legumes');
      
      final allCategories = await getAllUseCase();
      final categoryToDelete = allCategories[1];

      await deleteUseCase(categoryToDelete.id!);

      final remainingCategories = await getAllUseCase();
      expect(remainingCategories.length, 2);
      expect(remainingCategories.any((c) => c.name == 'Verduras'), false);
      expect(remainingCategories.any((c) => c.name == 'Frutas'), true);
      expect(remainingCategories.any((c) => c.name == 'Legumes'), true);
    });

    test('Deve manter timestamps corretos ao criar categoria', () async {

      final beforeCreate = DateTime.now().subtract(Duration(seconds: 1));

      await createUseCase('Frutas');

      final afterCreate = DateTime.now().add(Duration(seconds: 1));
      
      final categories = await getAllUseCase();
      final category = categories.first;
      
      expect(category.createdAt.isAfter(beforeCreate), true);
      expect(category.createdAt.isBefore(afterCreate), true);
      expect(category.updatedAt.isAfter(beforeCreate), true);
      expect(category.updatedAt.isBefore(afterCreate), true);
      expect(category.createdAt, category.updatedAt);
    });

    test('Deve atualizar o timestamp ao atualizar categoria', () async {

      await createUseCase('Frutas');
      final categories = await getAllUseCase();
      final originalCategory = categories.first;
      final originalUpdatedAt = originalCategory.updatedAt;

      await Future.delayed(Duration(milliseconds: 50));

      final updatedCategory = originalCategory.copyWith(
        name: 'Frutas Tropicais',
        updatedAt: DateTime.now(),
      );

      await updateUseCase(updatedCategory);

      final result = await getByIdUseCase(originalCategory.id!);
      expect(result, isNotNull);
      expect(result!.name, 'Frutas Tropicais');
      expect(result.createdAt, originalCategory.createdAt);
      expect(
        result.updatedAt.millisecondsSinceEpoch >= originalUpdatedAt.millisecondsSinceEpoch,
        true,
      );
    });
  });
}
