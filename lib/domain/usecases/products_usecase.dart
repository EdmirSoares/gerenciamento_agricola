import 'package:gerenciamento_agricola/domain/entities/products_entity.dart';
import 'package:gerenciamento_agricola/domain/repositories/products_repository.dart';

class CreateProductUseCase {
  final IProductRepository _repository;

  CreateProductUseCase(this._repository);

  Future<void> call(
    String name,
    int categoryId,
    String unit,
    String description,
    bool isProduction,
    DateTime createdAt,
    DateTime updatedAt,
  ) async {
    final product = ProductsEntity.create(
      name: name,
      categoryId: categoryId,
      unit: unit,
      description: description,
      isProduction: isProduction,
    );
    await _repository.saveProduct(product);
  }
}

class UpdateProductUseCase {
  final IProductRepository _repository;

  UpdateProductUseCase(this._repository);

  Future<void> call(ProductsEntity product) async {
    await _repository.updateProduct(product);
  }
}

class GetAllProductsUseCase {
  final IProductRepository _repository;

  GetAllProductsUseCase(this._repository);

  Future<List<ProductsEntity>> call() async {
    return await _repository.getAllProducts();
  }
}

class GetProductByIdUseCase {
  final IProductRepository _repository;

  GetProductByIdUseCase(this._repository);

  Future<ProductsEntity?> call(int id) async {
    return await _repository.getProductById(id);
  }
}

class DeleteProductByIdUseCase {
  final IProductRepository _repository;

  DeleteProductByIdUseCase(this._repository);

  Future<void> call(int id) async {
    await _repository.deleteProduct(id);
  }
}

class GetProductsByCategoryIdUseCase {
  final IProductRepository _repository;

  GetProductsByCategoryIdUseCase(this._repository);

  Future<List<ProductsEntity>> call(int categoryId) async {
    final allProducts = await _repository.getProductsByCategoryId(categoryId);
    return allProducts.where((product) => !product.isDeleted).toList();
  }
}

class GetProductsByNameUseCase {
  final IProductRepository _repository;

  GetProductsByNameUseCase(this._repository);

  Future<List<ProductsEntity>> call(String name) async {
    final allProducts = await _repository.searchProductsByName(name);
    return allProducts.where((product) => !product.isDeleted).toList();
  }
}

class GetProductionProductsUseCase {
  final IProductRepository _repository;

  GetProductionProductsUseCase(this._repository);

  Future<List<ProductsEntity>> call() async {
    final allProducts = await _repository.getProductionProducts();
    return allProducts.where((product) => !product.isDeleted).toList();
  }
}
