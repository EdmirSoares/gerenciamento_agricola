import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_agricola/domain/usecases/supplier_usecase.dart';
import 'supplier_state.dart';

class SupplierCubit extends Cubit<SupplierState> {
  final CreateSupplierUseCase _createUseCase;
  final UpdateSupplierUseCase _updateUseCase;
  final DeleteSupplierByIdUseCase _deleteUseCase;
  final GetAllSuppliersUseCase _getAllUseCase;
  final GetSupplierByIdUseCase _getByIdUseCase;
  final SearchSuppliersByNameUseCase _searchByNameUseCase;

  SupplierCubit(
    this._createUseCase,
    this._getAllUseCase,
    this._getByIdUseCase,
    this._updateUseCase,
    this._deleteUseCase,
    this._searchByNameUseCase,
  ) : super(SupplierInitial());

  Future<void> createSupplier(String name, String? contactInfo) async {
    try {
      await _createUseCase(name, contactInfo);
      await loadSuppliers();
    } on ArgumentError catch (e) {
      emit(
        SupplierError(
          'Dados inválidos',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        SupplierError(
          'Erro ao criar fornecedor',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> updateSupplier(
    int id,
    String name,
    String? contactInfo,
  ) async {
    try {
      final supplier = await _getByIdUseCase(id);

      if (supplier == null) {
        emit(
          SupplierError(
            'Fornecedor não encontrado',
            type: ErrorType.notFound,
          ),
        );
        return;
      }

      final updatedSupplier = supplier.copyWith(
        name: name,
        contactInfo: contactInfo,
        updatedAt: DateTime.now(),
      );

      await _updateUseCase(updatedSupplier);
      await loadSuppliers();
    } on ArgumentError catch (e) {
      emit(
        SupplierError(
          'Dados inválidos',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        SupplierError(
          'Erro ao atualizar fornecedor',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadSuppliers() async {
    emit(SupplierLoading());
    try {
      final suppliers = await _getAllUseCase();
      emit(SuppliersLoaded(suppliers));
    } on ArgumentError catch (e) {
      emit(
        SupplierError(
          'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        SupplierError(
          'Erro ao carregar fornecedores',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> searchSuppliersByName(String name) async {
    emit(SupplierLoading());
    try {
      final suppliers = await _searchByNameUseCase(name);
      emit(SuppliersLoaded(suppliers));
    } on ArgumentError catch (e) {
      emit(
        SupplierError(
          'Nome de busca inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        SupplierError(
          'Erro ao buscar fornecedores',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> deleteSupplier(int id) async {
    try {
      await _deleteUseCase(id);
      await loadSuppliers();
    } on ArgumentError catch (e) {
      emit(
        SupplierError(
          'ID inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        SupplierError(
          'Erro ao deletar fornecedor',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }
}
