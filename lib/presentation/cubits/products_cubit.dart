import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_agricola/domain/usecases/products_usecase.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final CreateProductUseCase _createUseCase;
  final UpdateProductUseCase _updateUseCase;
  final GetAllProductsUseCase _getAllUseCase;
  final GetProductByIdUseCase _getByIdUseCase;
  final GetProductsByCategoryIdUseCase _getByCategoryIdUseCase;
  final GetProductsByNameUseCase _getByNameUseCase;
  final GetProductionProductsUseCase _getProductionProductsUseCase;
  final DeleteProductByIdUseCase _deleteUseCase;

  ProductsCubit(
    this._createUseCase,
    this._getAllUseCase,
    this._getByIdUseCase,
    this._getByCategoryIdUseCase,
    this._getByNameUseCase,
    this._getProductionProductsUseCase,
    this._updateUseCase,
    this._deleteUseCase,
  ) : super(ProductsInitial());

  Future<void> createProduct(
    String name,
    int categoryId,
    String unit,
    String description,
    bool isProduction,
  ) async {
    emit(ProductsLoading());
    try {
      await _createUseCase(name, categoryId, unit, description, isProduction);
      await loadProducts();
    } catch (e) {
      emit(ProductOperationError(e.toString()));
    }
  }

  Future<void> updateProduct(
    int id,
    String name,
    int categoryId,
    String unit,
    String description,
    bool isProduction,
  ) async {
    emit(ProductsLoading());
    try {
      final product = await _getByIdUseCase(id);
      if (product == null) {
        emit(ProductOperationError("Produto não encontrado"));
        return;
      }
      final updatedProduct = product.copyWith(
        name: name,
        categoryId: categoryId,
        unit: unit,
        description: description,
        isProduction: isProduction,
        updatedAt: DateTime.now(),
      );
      await _updateUseCase(updatedProduct);
      await loadProducts();
    } catch (e) {
      emit(ProductOperationError(e.toString()));
    }
  }

  Future<void> loadProducts() async {
    emit(ProductsLoading());
    try {
      final products = await _getAllUseCase();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductOperationError(e.toString()));
    }
  }

  Future<void> loadProductsByCategoryId(int categoryId) async {
    emit(ProductsLoading());
    try {
      final products = await _getByCategoryIdUseCase(categoryId);
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductOperationError(e.toString()));
    }
  }

  Future<void> loadProductsByName(String name) async {
    emit(ProductsLoading());
    try {
      final products = await _getByNameUseCase(name);
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductOperationError(e.toString()));
    }
  }

  Future<void> loadProductionProducts() async {
    emit(ProductsLoading());
    try {
      final products = await _getProductionProductsUseCase();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductOperationError(e.toString()));
    }
  }

  Future<void> deleteProduct(int id) async {
    emit(ProductsLoading());
    try {
      await _deleteUseCase(id);
      await loadProducts();
    } catch (e) {
      emit(ProductOperationError(e.toString()));
    }
  }
}
