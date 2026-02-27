import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/purchase_item_entity.dart';
import '../../domain/usecases/purchase_item_usecase.dart';
import '../widgets/error_display_widget.dart';
import 'purchase_item_state.dart';

class PurchaseItemCubit extends Cubit<PurchaseItemState> {
  final CreatePurchaseItemUseCase _createPurchaseItemUseCase;
  final GetAllPurchaseItemsUseCase _getAllPurchaseItemsUseCase;
  final GetItemsByPurchaseIdUseCase _getItemsByPurchaseIdUseCase;
  final GetItemsByProductIdUseCase _getItemsByProductIdUseCase;
  final UpdatePurchaseItemUseCase _updatePurchaseItemUseCase;
  final DeletePurchaseItemByIdUseCase _deletePurchaseItemByIdUseCase;

  PurchaseItemCubit(
    this._createPurchaseItemUseCase,
    this._getAllPurchaseItemsUseCase,
    this._getItemsByPurchaseIdUseCase,
    this._getItemsByProductIdUseCase,
    this._updatePurchaseItemUseCase,
    this._deletePurchaseItemByIdUseCase,
  ) : super(PurchaseItemInitial());

  Future<void> createPurchaseItem(PurchaseItemEntity item) async {
    emit(PurchaseItemLoading());
    try {
      await _createPurchaseItemUseCase(item);
      emit(PurchaseItemSuccess('Item de compra criado com sucesso'));
      await loadAllPurchaseItems();
    } on ArgumentError catch (e) {
      emit(
        PurchaseItemError(
          message: 'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        PurchaseItemError(
          message: 'Falha ao criar item de compra',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> updatePurchaseItem(PurchaseItemEntity item) async {
    emit(PurchaseItemLoading());
    try {
      await _updatePurchaseItemUseCase(item);
      emit(PurchaseItemSuccess('Item de compra atualizado com sucesso'));
      await loadAllPurchaseItems();
    } on ArgumentError catch (e) {
      emit(
        PurchaseItemError(
          message: 'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        PurchaseItemError(
          message: 'Falha ao atualizar item de compra',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadAllPurchaseItems() async {
    emit(PurchaseItemLoading());
    try {
      final items = await _getAllPurchaseItemsUseCase();
      emit(PurchaseItemsLoaded(items));
    } catch (e) {
      emit(
        PurchaseItemError(
          message: 'Falha ao carregar itens de compra',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadItemsByPurchaseId(int purchaseId) async {
    emit(PurchaseItemLoading());
    try {
      final items = await _getItemsByPurchaseIdUseCase(purchaseId);
      emit(PurchaseItemsLoaded(items));
    } on ArgumentError catch (e) {
      emit(
        PurchaseItemError(
          message: 'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        PurchaseItemError(
          message: 'Falha ao carregar itens de compra',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadItemsByProductId(int productId) async {
    emit(PurchaseItemLoading());
    try {
      final items = await _getItemsByProductIdUseCase(productId);
      emit(PurchaseItemsLoaded(items));
    } on ArgumentError catch (e) {
      emit(
        PurchaseItemError(
          message: 'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        PurchaseItemError(
          message: 'Falha ao carregar itens de compra',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> deletePurchaseItem(int id) async {
    emit(PurchaseItemLoading());
    try {
      await _deletePurchaseItemByIdUseCase(id);
      emit(PurchaseItemSuccess('Item de compra deletado com sucesso'));
      await loadAllPurchaseItems();
    } on ArgumentError catch (e) {
      emit(
        PurchaseItemError(
          message: 'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        PurchaseItemError(
          message: 'Falha ao deletar item de compra',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }
}
