import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_agricola/domain/usecases/stock_usecase.dart';
import 'package:gerenciamento_agricola/presentation/widgets/error_display_widget.dart';
import 'package:gerenciamento_agricola/presentation/cubits/stock_state.dart';

class StockCubit extends Cubit<StockState> {
  final AddStockUseCase _addStockUseCase;
  final UpdateStockUseCase _updateStockUseCase;
  final GetAllStockUseCase _getAllStockUseCase;
  final GetStockByIdUseCase _getStockByIdUseCase;
  final GetStockByProductIdUseCase _getStockByProductIdUseCase;
  final GetStockBelowQuantityUseCase _getStockBelowQuantityUseCase;
  final GetStockExpiringWithinUseCase _getStockExpiringWithinUseCase;
  final SearchStockByProductNameUseCase _searchStockByProductNameUseCase;
  final DeleteStockByIdUseCase _deleteStockByIdUseCase;
  final DeleteExpiredStockUseCase _deleteExpiredStockUseCase;
  final DeleteStockBelowQuantityUseCase _deleteStockBelowQuantityUseCase;

  StockCubit(
    this._addStockUseCase,
    this._updateStockUseCase,
    this._getAllStockUseCase,
    this._getStockByIdUseCase,
    this._getStockByProductIdUseCase,
    this._getStockBelowQuantityUseCase,
    this._getStockExpiringWithinUseCase,
    this._searchStockByProductNameUseCase,
    this._deleteStockByIdUseCase,
    this._deleteExpiredStockUseCase,
    this._deleteStockBelowQuantityUseCase,
  ) : super(StockInicial());

  Future<void> addStock(
    int productId,
    double quantity,
    double? minimumStock,
    String? location,
    String? lotNumber,
    DateTime? expirationDate,
  ) async {
    emit(StockLoading());
    try {
      await _addStockUseCase(
        productId,
        quantity,
        minimumStock,
        location,
        lotNumber,
        expirationDate,
      );
      await loadAllStock();
    } on ArgumentError catch (e) {
      emit(
        StockError(
          'Dados inválidos',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockError(
          'Erro ao adicionar estoque',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> updateStock(
    int stockId,
    double quantity,
    double? minimumStock,
    String? location,
    String? lotNumber,
    DateTime? expirationDate,
  ) async {
    emit(StockLoading());
    try {
      final stock = await _getStockByIdUseCase(stockId);

      if (stock == null) {
        emit(StockError('Estoque não encontrado', type: ErrorType.notFound));
        return;
      }

      final updatedStock = stock.copyWith(
        quantity: quantity,
        minimumStock: minimumStock,
        location: location,
        lotNumber: lotNumber,
        expirationDate: expirationDate,
        updatedAt: DateTime.now(),
      );

      await _updateStockUseCase(updatedStock);
      await loadAllStock();
    } on ArgumentError catch (e) {
      emit(
        StockError(
          'Dados inválidos',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockError(
          'Erro ao atualizar estoque',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadAllStock() async {
    emit(StockLoading());
    try {
      final stocks = await _getAllStockUseCase();
      emit(StockLoaded(stocks));
    } on ArgumentError catch (e) {
      emit(
        StockError(
          'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockError(
          'Erro ao carregar estoque',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadStockById(int id) async {
    emit(StockLoading());
    try {
      final stock = await _getStockByIdUseCase(id);

      if (stock == null) {
        emit(StockError('Estoque não encontrado', type: ErrorType.notFound));
        return;
      }

      emit(StockLoaded([stock]));
    } on ArgumentError catch (e) {
      emit(
        StockError(
          'ID inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockError(
          'Erro ao buscar estoque',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadStockByProductId(int productId) async {
    emit(StockLoading());
    try {
      final stocks = await _getStockByProductIdUseCase(productId);
      emit(StockLoaded(stocks));
    } on ArgumentError catch (e) {
      emit(
        StockError(
          'ID de produto inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockError(
          'Erro ao buscar estoque por produto',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadStockBelowQuantity(double threshold) async {
    emit(StockLoading());
    try {
      final stocks = await _getStockBelowQuantityUseCase(threshold);
      emit(StockLoaded(stocks));
    } on ArgumentError catch (e) {
      emit(
        StockError(
          'Limite de quantidade inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockError(
          'Erro ao buscar estoque abaixo da quantidade',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadStockExpiringWithin(int days) async {
    emit(StockLoading());
    try {
      final stocks = await _getStockExpiringWithinUseCase(days);
      emit(StockLoaded(stocks));
    } on ArgumentError catch (e) {
      emit(
        StockError(
          'Número de dias inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockError(
          'Erro ao buscar estoque próximo do vencimento',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> searchStockByProductName(String productName) async {
    emit(StockLoading());
    try {
      final stocks = await _searchStockByProductNameUseCase(productName);
      emit(StockLoaded(stocks));
    } on ArgumentError catch (e) {
      emit(
        StockError(
          'Nome de produto inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockError(
          'Erro ao buscar estoque por nome de produto',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> deleteStockById(int id) async {
    emit(StockLoading());
    try {
      await _deleteStockByIdUseCase(id);
      await loadAllStock();
    } on ArgumentError catch (e) {
      emit(
        StockError(
          'ID inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockError(
          'Erro ao deletar estoque',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> deleteExpiredStock() async {
    emit(StockLoading());
    try {
      await _deleteExpiredStockUseCase();
      await loadAllStock();
    } catch (e) {
      emit(
        StockError(
          'Erro ao deletar estoque vencido',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> deleteStockBelowQuantity(double threshold) async {
    emit(StockLoading());
    try {
      await _deleteStockBelowQuantityUseCase(threshold);
      await loadAllStock();
    } on ArgumentError catch (e) {
      emit(
        StockError(
          'Limite de quantidade inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        StockError(
          'Erro ao deletar estoque abaixo da quantidade',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }
}
