import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_agricola/data/database/tables.dart';
import 'package:gerenciamento_agricola/domain/usecases/stock_movements_usecase.dart';
import 'package:gerenciamento_agricola/presentation/cubits/stock_movements/stock_movements_state.dart';

class StockMovementsCubit extends Cubit<StockMovementsState> {
  final AddStockMovementUseCase _addStockMovementUseCase;
  final UpdateStockMovementUseCase _updateStockMovementUseCase;
  final DeleteStockMovementsUseCase _deleteStockMovementsUseCase;
  final GetAllStockMovementsUseCase _getAllStockMovementsUseCase;
  final GetStockMovementByIdUseCase _getStockMovementByIdUseCase;
  final GetMovementsByProductIdUseCase _getMovementsByProductIdUseCase;
  final GetMovementsByTypeUseCase _getMovementsByTypeUseCase;
  final GetMovementsByDateRangeUseCase _getMovementsByDateRangeUseCase;
  final SearchMovementsByProductNameUseCase
  _searchMovementsByProductNameUseCase;
  final GetMovementsByCategoryUseCase _getMovementsByCategoryUseCase;

  StockMovementsCubit(
    this._addStockMovementUseCase,
    this._updateStockMovementUseCase,
    this._deleteStockMovementsUseCase,
    this._getAllStockMovementsUseCase,
    this._getStockMovementByIdUseCase,
    this._getMovementsByProductIdUseCase,
    this._getMovementsByTypeUseCase,
    this._getMovementsByDateRangeUseCase,
    this._searchMovementsByProductNameUseCase,
    this._getMovementsByCategoryUseCase,
  ) : super(StockMovementsInicial());

  Future<void> addStockMovement(
    int productId,
    double quantity,
    StockMovementType type,
    int? unitCostInCents,
    String? referenceType,
  ) async {
    emit(StockMovementsLoading());
    try {
      await _addStockMovementUseCase(
        productId,
        quantity,
        type,
        unitCostInCents,
        referenceType,
      );
      await loadAllStockMovements();
    } on ArgumentError catch (e) {
      emit(
        StockMovementsError(
          'Dados inválidos',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockMovementsError(
          'Erro ao adicionar movimentação',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> updateStockMovement(
    int movementId,
    int productId,
    double quantity,
    StockMovementType type,
    int? unitCostInCents,
    String? referenceType,
  ) async {
    emit(StockMovementsLoading());
    try {
      final existingMovement = await _getStockMovementByIdUseCase(movementId);

      if (existingMovement == null) {
        throw Exception('Movimentação não encontrada');
      }

      final updatedMovement = existingMovement.copyWith(
        productId: productId,
        type: type,
        quantity: quantity,
        unitCostInCents: unitCostInCents,
        referenceType: referenceType,
        updatedAt: DateTime.now(),
      );

      await _updateStockMovementUseCase(updatedMovement);
      await loadAllStockMovements();
    } on ArgumentError catch (e) {
      emit(
        StockMovementsError(
          'Dados inválidos',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockMovementsError(
          'Erro ao atualizar movimentação',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadAllStockMovements() async {
    emit(StockMovementsLoading());
    try {
      final stocks = await _getAllStockMovementsUseCase();
      emit(StockMovementWithProductLoaded(stocks));
    } on ArgumentError catch (e) {
      emit(
        StockMovementsError(
          'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockMovementsError(
          'Erro ao carregar movimentações',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> deleteStockMovements(List<int> ids) async {
    emit(StockMovementsLoading());
    try {
      await _deleteStockMovementsUseCase(ids);
      await loadAllStockMovements();
    } on ArgumentError catch (e) {
      emit(
        StockMovementsError(
          'Dados inválidos',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockMovementsError(
          'Erro ao deletar movimentações',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> getStockMovementById(int id) async {
    emit(StockMovementsLoading());
    try {
      final movement = await _getStockMovementByIdUseCase(id);

      if (movement == null) {
        emit(
          StockMovementsError(
            'Movimentação não encontrada',
            type: ErrorType.notFound,
          ),
        );
        return;
      }
      emit(StockMovementsInicial());
    } on ArgumentError catch (e) {
      emit(
        StockMovementsError(
          'ID inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockMovementsError(
          'Erro ao buscar movimentação',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> getMovementsByProductId(int productId) async {
    emit(StockMovementsLoading());
    try {
      final movements = await _getMovementsByProductIdUseCase(productId);
      emit(StockMovementWithProductLoaded(movements));
    } on ArgumentError catch (e) {
      emit(
        StockMovementsError(
          'ID do produto inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockMovementsError(
          'Erro ao buscar movimentações do produto',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> getMovementsByType(StockMovementType type) async {
    emit(StockMovementsLoading());
    try {
      final movements = await _getMovementsByTypeUseCase(type);
      emit(StockMovementWithProductLoaded(movements));
    } catch (e) {
      emit(
        StockMovementsError(
          'Erro ao buscar movimentações por tipo',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> getMovementsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    emit(StockMovementsLoading());
    try {
      final movements = await _getMovementsByDateRangeUseCase(
        startDate,
        endDate,
      );
      emit(StockMovementWithProductLoaded(movements));
    } on ArgumentError catch (e) {
      emit(
        StockMovementsError(
          'Intervalo de datas inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockMovementsError(
          'Erro ao buscar movimentações por período',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> searchMovementsByProductName(String productName) async {
    emit(StockMovementsLoading());
    try {
      final movements = await _searchMovementsByProductNameUseCase(productName);
      emit(StockMovementWithProductLoaded(movements));
    } on ArgumentError catch (e) {
      emit(
        StockMovementsError(
          'Nome do produto inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockMovementsError(
          'Erro ao buscar movimentações por nome',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> getMovementsByCategory(int categoryId) async {
    emit(StockMovementsLoading());
    try {
      final movements = await _getMovementsByCategoryUseCase(categoryId);
      emit(StockMovementWithProductLoaded(movements));
    } on ArgumentError catch (e) {
      emit(
        StockMovementsError(
          'ID da categoria inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockMovementsError(
          'Erro ao buscar movimentações por categoria',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }
}
