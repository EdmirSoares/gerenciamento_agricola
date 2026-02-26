import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_agricola/domain/usecases/products_usecase.dart';
import '../widgets/error_display_widget.dart';
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
    } on ArgumentError catch (e) {
      emit(
        ProductOperationError(
          'Dados inválidos',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        ProductOperationError(
          'Erro ao criar produto',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
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
        emit(
          ProductOperationError(
            'Produto não encontrado',
            type: ErrorType.notFound,
          ),
        );
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
    } on ArgumentError catch (e) {
      emit(
        ProductOperationError(
          'Dados inválidos',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        ProductOperationError(
          'Erro ao atualizar produto',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadProducts() async {
    emit(ProductsLoading());
    try {
      final products = await _getAllUseCase();
      emit(ProductsLoaded(products));
    } on ArgumentError catch (e) {
      emit(
        ProductOperationError(
          'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        ProductOperationError(
          'Erro ao carregar produtos',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadProductsByCategoryId(int categoryId) async {
    emit(ProductsLoading());
    try {
      final products = await _getByCategoryIdUseCase(categoryId);
      emit(ProductsLoaded(products));
    } on ArgumentError catch (e) {
      emit(
        ProductOperationError(
          'ID de categoria inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        ProductOperationError(
          'Erro ao buscar produtos por categoria',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadProductsByName(String name) async {
    emit(ProductsLoading());
    try {
      final products = await _getByNameUseCase(name);
      emit(ProductsLoaded(products));
    } on ArgumentError catch (e) {
      emit(
        ProductOperationError(
          'Nome de busca inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        ProductOperationError(
          'Erro ao buscar produtos por nome',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadProductionProducts() async {
    emit(ProductsLoading());
    try {
      final products = await _getProductionProductsUseCase();
      emit(ProductsLoaded(products));
    } on ArgumentError catch (e) {
      emit(
        ProductOperationError(
          'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        ProductOperationError(
          'Erro ao buscar produtos de produção',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> deleteProduct(int id) async {
    emit(ProductsLoading());
    try {
      await _deleteUseCase(id);
      await loadProducts();
    } on ArgumentError catch (e) {
      emit(
        ProductOperationError(
          'ID inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        ProductOperationError(
          'Erro ao deletar produto',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }
}
