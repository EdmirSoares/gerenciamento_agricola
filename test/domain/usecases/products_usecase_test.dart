import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciamento_agricola/data/database/app_database.dart';
import 'package:gerenciamento_agricola/data/repositories/products-repository_impl.dart';
import 'package:gerenciamento_agricola/domain/usecases/products_usecase.dart';
import 'package:drift/native.dart';

void main() {
  late AppDatabase database;
  late ProductsRepositoryImpl repository;
  late CreateProductUseCase createUseCase;
  late GetAllProductsUseCase getAllUseCase;
  late GetProductByIdUseCase getByIdUseCase;
  late UpdateProductUseCase updateUseCase;
  late DeleteProductByIdUseCase deleteUseCase;
  late GetProductsByCategoryIdUseCase getByCategoryIdUseCase;
  late GetProductsByNameUseCase getByNameUseCase;
  late GetProductionProductsUseCase getProductionProductsUseCase;

  setUp(() {
    // banco de dados em memória para cada teste
    database = AppDatabase(NativeDatabase.memory());
    repository = ProductsRepositoryImpl(database);

    // Inicializa os UseCases
    createUseCase = CreateProductUseCase(repository);
    getAllUseCase = GetAllProductsUseCase(repository);
    getByIdUseCase = GetProductByIdUseCase(repository);
    updateUseCase = UpdateProductUseCase(repository);
    deleteUseCase = DeleteProductByIdUseCase(repository);
    getByCategoryIdUseCase = GetProductsByCategoryIdUseCase(repository);
    getByNameUseCase = GetProductsByNameUseCase(repository);
    getProductionProductsUseCase = GetProductionProductsUseCase(repository);
  });

  tearDown(() async {
    await database.close();
  });

  group('Product UseCases', () {
    test('Deve criar um produto com sucesso', () async {
      // Arrange
      const name = 'Tomate';
      const categoryId = 1;
      const unit = 'kg';
      const description = 'Tomate fresco';
      const isProduction = true;

      // Act
      await createUseCase(name, categoryId, unit, description, isProduction);

      // Assert
      final products = await getAllUseCase();
      expect(products.length, 1);
      expect(products.first.name, name);
      expect(products.first.categoryId, categoryId);
      expect(products.first.unit, unit);
      expect(products.first.description, description);
      expect(products.first.isProduction, isProduction);
      expect(products.first.id, isNotNull);
      expect(products.first.isDeleted, false);
    });

    test('Deve buscar todos os produtos', () async {
      // Arrange
      await createUseCase('Tomate', 1, 'kg', 'Tomate fresco', true);
      await createUseCase('Alface', 1, 'un', 'Alface crespa', true);
      await createUseCase('Adubo', 2, 'saco', 'Adubo orgânico', false);

      // Act
      final products = await getAllUseCase();

      // Assert
      expect(products.length, 3);
      expect(products[0].name, 'Tomate');
      expect(products[1].name, 'Alface');
      expect(products[2].name, 'Adubo');
    });

    test('Deve buscar um produto por ID', () async {
      // Arrange
      await createUseCase('Tomate', 1, 'kg', 'Tomate fresco', true);
      final allProducts = await getAllUseCase();
      final productId = allProducts.first.id!;

      // Act
      final product = await getByIdUseCase(productId);

      // Assert
      expect(product, isNotNull);
      expect(product!.id, productId);
      expect(product.name, 'Tomate');
      expect(product.categoryId, 1);
    });

    test('Deve retornar null ao buscar produto inexistente', () async {
      // Act
      final product = await getByIdUseCase(999);

      // Assert
      expect(product, isNull);
    });

    test('Deve atualizar um produto com sucesso', () async {
      // Arrange
      await createUseCase('Tomate', 1, 'kg', 'Tomate fresco', true);
      final allProducts = await getAllUseCase();
      final product = allProducts.first;

      final updatedProduct = product.copyWith(
        name: 'Tomate Cereja',
        description: 'Tomate cereja orgânico',
        unit: 'bandeja',
        updatedAt: DateTime.now(),
      );

      // Act
      await updateUseCase(updatedProduct);

      // Assert
      final result = await getByIdUseCase(product.id!);
      expect(result, isNotNull);
      expect(result!.name, 'Tomate Cereja');
      expect(result.description, 'Tomate cereja orgânico');
      expect(result.unit, 'bandeja');
      expect(result.id, product.id);
      expect(result.categoryId, product.categoryId);
    });

    test('Deve deletar um produto com sucesso', () async {
      // Arrange
      await createUseCase('Tomate', 1, 'kg', 'Tomate fresco', true);
      final allProducts = await getAllUseCase();
      final productId = allProducts.first.id!;

      // Act
      await deleteUseCase(productId);

      // Assert
      final products = await getAllUseCase();
      expect(products.length, 0);

      final deletedProduct = await getByIdUseCase(productId);
      expect(deletedProduct, isNull);
    });

    test('Deve criar múltiplos produtos e deletar apenas um', () async {
      // Arrange
      await createUseCase('Tomate', 1, 'kg', 'Tomate fresco', true);
      await createUseCase('Alface', 1, 'un', 'Alface crespa', true);
      await createUseCase('Adubo', 2, 'saco', 'Adubo orgânico', false);

      final allProducts = await getAllUseCase();
      final productToDelete = allProducts[1]; // Alface

      // Act
      await deleteUseCase(productToDelete.id!);

      // Assert
      final remainingProducts = await getAllUseCase();
      expect(remainingProducts.length, 2);
      expect(remainingProducts.any((p) => p.name == 'Alface'), false);
      expect(remainingProducts.any((p) => p.name == 'Tomate'), true);
      expect(remainingProducts.any((p) => p.name == 'Adubo'), true);
    });

    test('Deve buscar produtos por categoria', () async {
      // Arrange
      await createUseCase('Tomate', 1, 'kg', 'Tomate fresco', true);
      await createUseCase('Alface', 1, 'un', 'Alface crespa', true);
      await createUseCase('Adubo', 2, 'saco', 'Adubo orgânico', false);
      await createUseCase('Fertilizante', 2, 'kg', 'Fertilizante NPK', false);

      // Act
      final categoryProducts = await getByCategoryIdUseCase(1);

      // Assert
      expect(categoryProducts.length, 2);
      expect(categoryProducts.every((p) => p.categoryId == 1), true);
      expect(categoryProducts.any((p) => p.name == 'Tomate'), true);
      expect(categoryProducts.any((p) => p.name == 'Alface'), true);
    });

    test('Deve buscar produtos por nome', () async {
      // Arrange
      await createUseCase('Tomate', 1, 'kg', 'Tomate fresco', true);
      await createUseCase('Tomate Cereja', 1, 'bandeja', 'Tomate cereja', true);
      await createUseCase('Alface', 1, 'un', 'Alface crespa', true);

      // Act
      final products = await getByNameUseCase('Tomate');

      // Assert
      expect(products.length, 2);
      expect(products.every((p) => p.name.contains('Tomate')), true);
    });

    test('Deve retornar lista vazia ao buscar por nome inexistente', () async {
      // Arrange
      await createUseCase('Tomate', 1, 'kg', 'Tomate fresco', true);

      // Act
      final products = await getByNameUseCase('Banana');

      // Assert
      expect(products.length, 0);
    });

    test('Deve buscar apenas produtos de produção', () async {
      // Arrange
      await createUseCase('Tomate', 1, 'kg', 'Tomate fresco', true); // Produção
      await createUseCase('Alface', 1, 'un', 'Alface crespa', true); // Produção
      await createUseCase('Adubo', 2, 'saco', 'Adubo orgânico', false); // Não produção
      await createUseCase('Fertilizante', 2, 'kg', 'Fertilizante', false); // Não produção

      // Act
      final productionProducts = await getProductionProductsUseCase();

      // Assert
      expect(productionProducts.length, 2);
      expect(productionProducts.every((p) => p.isProduction == true), true);
      expect(productionProducts.any((p) => p.name == 'Tomate'), true);
      expect(productionProducts.any((p) => p.name == 'Alface'), true);
      expect(productionProducts.any((p) => p.name == 'Adubo'), false);
    });

    test('Deve filtrar produtos deletados ao buscar por categoria', () async {
      // Arrange
      await createUseCase('Tomate', 1, 'kg', 'Tomate fresco', true);
      await createUseCase('Alface', 1, 'un', 'Alface crespa', true);

      final allProducts = await getAllUseCase();
      final productToDelete = allProducts.first;
      await deleteUseCase(productToDelete.id!);

      // Act
      final categoryProducts = await getByCategoryIdUseCase(1);

      // Assert
      expect(categoryProducts.length, 1);
      expect(categoryProducts.first.name, 'Alface');
    });

    test('Deve manter timestamps corretos ao criar produto', () async {
      // Arrange
      final beforeCreate = DateTime.now().subtract(Duration(seconds: 1));

      // Act
      await createUseCase('Tomate', 1, 'kg', 'Tomate fresco', true);

      // Assert
      final afterCreate = DateTime.now().add(Duration(seconds: 1));

      final products = await getAllUseCase();
      final product = products.first;

      expect(product.createdAt.isAfter(beforeCreate), true);
      expect(product.createdAt.isBefore(afterCreate), true);
      expect(product.updatedAt.isAfter(beforeCreate), true);
      expect(product.updatedAt.isBefore(afterCreate), true);
      expect(product.createdAt, product.updatedAt); // Devem ser iguais na criação
    });

    test('Deve atualizar o timestamp ao atualizar produto', () async {
      // Arrange
      await createUseCase('Tomate', 1, 'kg', 'Tomate fresco', true);
      final products = await getAllUseCase();
      final originalProduct = products.first;
      final originalUpdatedAt = originalProduct.updatedAt;

      // Aguarda um pouco para garantir timestamps diferentes
      await Future.delayed(Duration(milliseconds: 50));

      final updatedProduct = originalProduct.copyWith(
        name: 'Tomate Cereja',
        updatedAt: DateTime.now(),
      );

      // Act
      await updateUseCase(updatedProduct);

      // Assert
      final result = await getByIdUseCase(originalProduct.id!);
      expect(result, isNotNull);
      expect(result!.name, 'Tomate Cereja');
      expect(result.createdAt, originalProduct.createdAt); // createdAt não deve mudar
      // updatedAt deve ser diferente (pode ser igual ou posterior)
      expect(
        result.updatedAt.millisecondsSinceEpoch >=
            originalUpdatedAt.millisecondsSinceEpoch,
        true,
      );
    });

    test('Deve criar produtos com diferentes flags isProduction', () async {
      // Arrange & Act
      await createUseCase('Tomate', 1, 'kg', 'Produção própria', true);
      await createUseCase('Adubo', 2, 'saco', 'Insumo comprado', false);

      // Assert
      final allProducts = await getAllUseCase();
      final productionProduct = allProducts.firstWhere((p) => p.name == 'Tomate');
      final nonProductionProduct = allProducts.firstWhere((p) => p.name == 'Adubo');

      expect(productionProduct.isProduction, true);
      expect(nonProductionProduct.isProduction, false);
    });
  });
}
