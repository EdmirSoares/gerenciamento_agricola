import 'package:gerenciamento_agricola/domain/entities/products_entity.dart';

abstract class IProductRepository {
  Future<void> saveProduct(ProductsEntity product);
  Future<List<ProductsEntity>> getAllProducts();
  Future<ProductsEntity?> getProductById(int id);
  Future<void> updateProduct(ProductsEntity product);
  Future<void> deleteProduct(int id);
  Future<List<ProductsEntity>> getProductsByCategoryId(int categoryId);
  Future<List<ProductsEntity>> searchProductsByName(String query);
  Future<List<ProductsEntity>> getProductionProducts();
}