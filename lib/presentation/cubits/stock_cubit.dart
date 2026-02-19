import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_agricola/domain/usecases/stock_usecase.dart';
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
    if (productId <= 0) {
      emit(StockError('ID do produto inválido'));
      return;
    }

    if (quantity < 0) {
      emit(StockError('Quantidade não pode ser negativa'));
      return;
    }

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
    } catch (e) {
      emit(StockError(e.toString()));
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
    if (stockId <= 0) {
      emit(StockError('ID do estoque inválido'));
      return;
    }

    emit(StockLoading());
    try {
      final stock = await _getStockByIdUseCase(stockId);
      if (stock == null) {
        emit(StockError('Estoque não encontrado'));
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
    } catch (e) {
      emit(StockError(e.toString()));
    }
  }

  Future<void> loadStockByProductId(int productId) async {
    if (productId <= 0) {
      emit(StockError('ID do produto inválido'));
      return;
    }

    emit(StockLoading());
    try {
      final stocks = await _getStockByProductIdUseCase(productId);
      emit(StockLoaded(stocks));
    } catch (e) {
      emit(StockError(e.toString()));
    }
  }

  Future<void> loadStockBelowQuantity(double threshold) async {
    if (threshold < 0) {
      emit(StockError('Quantidade limite não pode ser negativa'));
      return;
    }

    emit(StockLoading());
    try {
      final stocks = await _getStockBelowQuantityUseCase(threshold);
      emit(StockLoaded(stocks));
    } catch (e) {
      emit(StockError(e.toString()));
    }
  }

  Future<void> loadStockExpiringWithin(int days) async {
    if (days < 0) {
      emit(StockError('Número de dias não pode ser negativo'));
      return;
    }

    emit(StockLoading());
    try {
      final stocks = await _getStockExpiringWithinUseCase(days);
      emit(StockLoaded(stocks));
    } catch (e) {
      emit(StockError(e.toString()));
    }
  }

  Future<void> searchStockByProductName(String query) async {
    final trimmedQuery = query.trim();
    if (trimmedQuery.isEmpty) {
      emit(StockError('Digite o nome do produto para buscar'));
      return;
    }

    emit(StockLoading());
    try {
      final stocks = await _searchStockByProductNameUseCase(trimmedQuery);
      emit(StockLoaded(stocks));
    } catch (e) {
      emit(StockError(e.toString()));
    }
  }

  Future<void> deleteStockById(int id) async {
    if (id <= 0) {
      emit(StockError('ID do estoque inválido'));
      return;
    }

    emit(StockLoading());
    try {
      await _deleteStockByIdUseCase(id);
      await loadAllStock();
    } catch (e) {
      emit(StockError(e.toString()));
    }
  }

  Future<void> deleteExpiredStock() async {
    emit(StockLoading());
    try {
      await _deleteExpiredStockUseCase();
      await loadAllStock();
    } catch (e) {
      emit(StockError(e.toString()));
    }
  }

  Future<void> deleteStockBelowQuantity(double threshold) async {
    if (threshold < 0) {
      emit(StockError('Quantidade limite não pode ser negativa'));
      return;
    }

    emit(StockLoading());
    try {
      await _deleteStockBelowQuantityUseCase(threshold);
      await loadAllStock();
    } catch (e) {
      emit(StockError(e.toString()));
    }
  }

  Future<void> loadStockById(int id) async {
    if (id <= 0) {
      emit(StockError('ID do estoque inválido'));
      return;
    }

    emit(StockLoading());
    try {
      final stock = await _getStockByIdUseCase(id);
      if (stock == null) {
        emit(StockError('Estoque não encontrado'));
        return;
      }
      emit(StockLoaded([stock]));
    } catch (e) {
      emit(StockError(e.toString()));
    }
  }

  Future<void> loadAllStock() async {
    emit(StockLoading());
    try {
      final stocks = await _getAllStockUseCase();
      emit(StockLoaded(stocks));
    } catch (e) {
      emit(StockError(e.toString()));
    }
  }
}
