import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_agricola/domain/usecases/purchase_usecase.dart';
import 'package:gerenciamento_agricola/presentation/widgets/error_display_widget.dart';
import 'purchase_state.dart';

class PurchaseCubit extends Cubit<PurchaseState> {
  final CreatePurchaseUseCase _createUseCase;
  final UpdatePurchaseUseCase _updateUseCase;
  final DeletePurchaseByIdUseCase _deleteUseCase;
  final GetAllPurchasesUseCase _getAllUseCase;
  final GetPurchaseByIdUseCase _getByIdUseCase;
  final GetPurchasesBySupplierUseCase _getBySupplierUseCase;
  final GetPendingPurchasesUseCase _getPendingUseCase;
  final GetOverduePurchasesUseCase _getOverdueUseCase;
  final GetPaidPurchasesUseCase _getPaidUseCase;
  final MarkPurchaseAsPaidUseCase _markAsPaidUseCase;

  PurchaseCubit(
    this._createUseCase,
    this._getAllUseCase,
    this._getByIdUseCase,
    this._getBySupplierUseCase,
    this._getPendingUseCase,
    this._getOverdueUseCase,
    this._getPaidUseCase,
    this._updateUseCase,
    this._deleteUseCase,
    this._markAsPaidUseCase,
  ) : super(PurchaseInitial());

  Future<void> createPurchase({
    required int supplierId,
    required DateTime purchaseDate,
    required int totalValueInCents,
    DateTime? dueDate,
    bool isPaid = false,
    DateTime? paymentDate,
    String? description,
  }) async {
    try {
      await _createUseCase(
        supplierId: supplierId,
        purchaseDate: purchaseDate,
        totalValueInCents: totalValueInCents,
        dueDate: dueDate,
        isPaid: isPaid,
        paymentDate: paymentDate,
        description: description,
      );
      await loadAllPurchases();
    } on ArgumentError catch (e) {
      emit(
        PurchaseError(
          'Dados inválidos',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        PurchaseError(
          'Erro ao criar compra',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> updatePurchase({
    required int id,
    required int supplierId,
    required DateTime purchaseDate,
    required int totalValueInCents,
    DateTime? dueDate,
    bool isPaid = false,
    DateTime? paymentDate,
    String? description,
  }) async {
    try {
      final purchase = await _getByIdUseCase(id);

      if (purchase == null) {
        emit(PurchaseError('Compra não encontrada', type: ErrorType.notFound));
        return;
      }

      final updatedPurchase = purchase.copyWith(
        supplierId: supplierId,
        purchaseDate: purchaseDate,
        totalValueInCents: totalValueInCents,
        dueDate: dueDate,
        isPaid: isPaid,
        paymentDate: paymentDate,
        description: description,
      );

      await _updateUseCase(updatedPurchase);
      await loadAllPurchases();
    } on ArgumentError catch (e) {
      emit(
        PurchaseError(
          'Dados inválidos',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        PurchaseError(
          'Erro ao atualizar compra',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadAllPurchases() async {
    emit(PurchaseLoading());
    try {
      final purchases = await _getAllUseCase();
      emit(PurchasesLoaded(purchases));
    } catch (e) {
      emit(
        PurchaseError(
          'Erro ao carregar compras',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadPurchasesBySupplier(int supplierId) async {
    emit(PurchaseLoading());
    try {
      final purchases = await _getBySupplierUseCase(supplierId);
      emit(PurchasesLoaded(purchases));
    } on ArgumentError catch (e) {
      emit(
        PurchaseError(
          'Dados inválidos',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        PurchaseError(
          'Erro ao carregar compras do fornecedor',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadPendingPurchases() async {
    emit(PurchaseLoading());
    try {
      final purchases = await _getPendingUseCase();
      emit(PurchasesLoaded(purchases));
    } catch (e) {
      emit(
        PurchaseError(
          'Erro ao carregar compras pendentes',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadOverduePurchases() async {
    emit(PurchaseLoading());
    try {
      final purchases = await _getOverdueUseCase();
      emit(PurchasesLoaded(purchases));
    } catch (e) {
      emit(
        PurchaseError(
          'Erro ao carregar compras vencidas',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadPaidPurchases() async {
    emit(PurchaseLoading());
    try {
      final purchases = await _getPaidUseCase();
      emit(PurchasesLoaded(purchases));
    } catch (e) {
      emit(
        PurchaseError(
          'Erro ao carregar compras pagas',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> deletePurchase(int id) async {
    try {
      await _deleteUseCase(id);
      await loadAllPurchases();
    } on ArgumentError catch (e) {
      emit(
        PurchaseError(
          'Dados inválidos',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        PurchaseError(
          'Erro ao deletar compra',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> markAsPaid(int id, DateTime paymentDate) async {
    try {
      await _markAsPaidUseCase(id, paymentDate);
      await loadAllPurchases();
    } on ArgumentError catch (e) {
      emit(
        PurchaseError(
          'Dados inválidos',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        PurchaseError(
          'Erro ao marcar compra como paga',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }
}
