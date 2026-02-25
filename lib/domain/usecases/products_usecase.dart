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
  ) async {
    try {
      final product = ProductsEntity.create(
        name: name,
        categoryId: categoryId,
        unit: unit,
        description: description,
        isProduction: isProduction,
      );
      await _repository.saveProduct(product);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Erro ao criar produto: ${e.toString()}');
    }
  }
}

class UpdateProductUseCase {
  final IProductRepository _repository;

  UpdateProductUseCase(this._repository);

  Future<void> call(ProductsEntity product) async {
    if (product.id == null) {
      throw ArgumentError('Não é possível atualizar produto sem ID');
    }

    try {
      await _repository.updateProduct(product);
    } catch (e) {
      throw Exception('Erro ao atualizar produto: ${e.toString()}');
    }
  }
}

class DeleteProductByIdUseCase {
  final IProductRepository _repository;

  DeleteProductByIdUseCase(this._repository);

  Future<void> call(int id) async {
    if (id <= 0) {
      throw ArgumentError('ID do produto deve ser maior que zero');
    }

    try {
      await _repository.deleteProduct(id);
    } catch (e) {
      throw Exception('Erro ao deletar produto: ${e.toString()}');
    }
  }
}

class GetAllProductsUseCase {
  final IProductRepository _repository;

  GetAllProductsUseCase(this._repository);

  Future<List<ProductsEntity>> call() async {
    try {
      return await _repository.getAllProducts();
    } catch (e) {
      throw Exception('Erro ao buscar produtos: ${e.toString()}');
    }
  }
}

class GetProductByIdUseCase {
  final IProductRepository _repository;

  GetProductByIdUseCase(this._repository);

  Future<ProductsEntity?> call(int id) async {
    if (id <= 0) {
      throw ArgumentError('ID do produto deve ser maior que zero');
    }

    try {
      return await _repository.getProductById(id);
    } catch (e) {
      throw Exception('Erro ao buscar produto por ID: ${e.toString()}');
    }
  }
}

class GetProductsByCategoryIdUseCase {
  final IProductRepository _repository;

  GetProductsByCategoryIdUseCase(this._repository);

  Future<List<ProductsEntity>> call(int categoryId) async {
    if (categoryId <= 0) {
      throw ArgumentError('ID da categoria deve ser maior que zero');
    }

    try {
      final allProducts = await _repository.getProductsByCategoryId(categoryId);
      return allProducts.where((product) => !product.isDeleted).toList();
    } catch (e) {
      throw Exception('Erro ao buscar produtos por categoria: ${e.toString()}');
    }
  }
}

class GetProductsByNameUseCase {
  final IProductRepository _repository;

  GetProductsByNameUseCase(this._repository);

  Future<List<ProductsEntity>> call(String name) async {
    if (name.trim().length < 2) {
      throw ArgumentError('Nome deve ter pelo menos 2 caracteres para busca');
    }

    try {
      final allProducts = await _repository.searchProductsByName(name.trim());
      return allProducts.where((product) => !product.isDeleted).toList();
    } catch (e) {
      throw Exception('Erro ao buscar produtos por nome: ${e.toString()}');
    }
  }
}

class GetProductionProductsUseCase {
  final IProductRepository _repository;

  GetProductionProductsUseCase(this._repository);

  Future<List<ProductsEntity>> call() async {
    try {
      final allProducts = await _repository.getProductionProducts();
      return allProducts.where((product) => !product.isDeleted).toList();
    } catch (e) {
      throw Exception('Erro ao buscar produtos de produção: ${e.toString()}');
    }
  }
}
