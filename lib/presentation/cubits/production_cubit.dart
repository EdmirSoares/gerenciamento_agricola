import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/production_entity.dart';
import '../../domain/usecases/production_usecase.dart';
import '../widgets/error_display_widget.dart';
import 'production_state.dart';

class ProductionCubit extends Cubit<ProductionState> {
  final CreateProductionUseCase _createProductionUseCase;
  final GetAllProductionsUseCase _getAllProductionsUseCase;
  final GetProductionsByProductIdUseCase _getProductionsByProductIdUseCase;
  final GetProductionsByAreaIdUseCase _getProductionsByAreaIdUseCase;
  final GetProductionsByDateRangeUseCase _getProductionsByDateRangeUseCase;
  final GetProfitableProductionsUseCase _getProfitableProductionsUseCase;
  final UpdateProductionUseCase _updateProductionUseCase;
  final DeleteProductionByIdUseCase _deleteProductionByIdUseCase;

  ProductionCubit(
    this._createProductionUseCase,
    this._getAllProductionsUseCase,
    this._getProductionsByProductIdUseCase,
    this._getProductionsByAreaIdUseCase,
    this._getProductionsByDateRangeUseCase,
    this._getProfitableProductionsUseCase,
    this._updateProductionUseCase,
    this._deleteProductionByIdUseCase,
  ) : super(ProductionInitial());

  Future<void> createProduction(ProductionEntity production) async {
    emit(ProductionLoading());
    try {
      await _createProductionUseCase(production);
      emit(ProductionSuccess('Produção criada com sucesso'));
      await loadAllProductions();
    } on ArgumentError catch (e) {
      emit(
        ProductionError(
          message: 'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        ProductionError(
          message: 'Falha ao criar produção',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> updateProduction(ProductionEntity production) async {
    emit(ProductionLoading());
    try {
      await _updateProductionUseCase(production);
      emit(ProductionSuccess('Produção atualizada com sucesso'));
      await loadAllProductions();
    } on ArgumentError catch (e) {
      emit(
        ProductionError(
          message: 'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        ProductionError(
          message: 'Falha ao atualizar produção',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadAllProductions() async {
    emit(ProductionLoading());
    try {
      final productions = await _getAllProductionsUseCase();
      emit(ProductionsLoaded(productions));
    } catch (e) {
      emit(
        ProductionError(
          message: 'Falha ao carregar produções',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadProductionsByProductId(int productId) async {
    emit(ProductionLoading());
    try {
      final productions = await _getProductionsByProductIdUseCase(productId);
      emit(ProductionsLoaded(productions));
    } on ArgumentError catch (e) {
      emit(
        ProductionError(
          message: 'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        ProductionError(
          message: 'Falha ao carregar produções',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadProductionsByAreaId(int areaId) async {
    emit(ProductionLoading());
    try {
      final productions = await _getProductionsByAreaIdUseCase(areaId);
      emit(ProductionsLoaded(productions));
    } on ArgumentError catch (e) {
      emit(
        ProductionError(
          message: 'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        ProductionError(
          message: 'Falha ao carregar produções',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadProductionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    emit(ProductionLoading());
    try {
      final productions = await _getProductionsByDateRangeUseCase(
        startDate,
        endDate,
      );
      emit(ProductionsLoaded(productions));
    } on ArgumentError catch (e) {
      emit(
        ProductionError(
          message: 'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        ProductionError(
          message: 'Falha ao carregar produções',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadProfitableProductions() async {
    emit(ProductionLoading());
    try {
      final productions = await _getProfitableProductionsUseCase();
      emit(ProductionsLoaded(productions));
    } catch (e) {
      emit(
        ProductionError(
          message: 'Falha ao carregar produções lucrativas',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> deleteProduction(int id) async {
    emit(ProductionLoading());
    try {
      await _deleteProductionByIdUseCase(id);
      emit(ProductionSuccess('Produção excluída com sucesso'));
      await loadAllProductions();
    } on ArgumentError catch (e) {
      emit(
        ProductionError(
          message: 'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        ProductionError(
          message: 'Falha ao excluir produção',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }
}
