import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_agricola/domain/usecases/category_usecase.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CreateCategoryUseCase _createUseCase;
  final UpdateCategoryUseCase _updateUseCase;
  final DeleteCategoryByIdUseCase _deleteUseCase;
  final GetAllCategoriesUseCase _getAllUseCase;
  final GetCategoryByIdUseCase _getByIdUseCase;

  CategoryCubit(
    this._createUseCase,
    this._getAllUseCase,
    this._getByIdUseCase,
    this._updateUseCase,
    this._deleteUseCase,
  ) : super(CategoryInitial());

  Future<void> createCategory(String name) async {
    emit(CategoryLoading());
    try {
      await _createUseCase(name);
      await loadCategories();
    } on ArgumentError catch (e) {
      emit(
        CategoryError(
          'Dados inválidos',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        CategoryError(
          'Erro ao criar categoria',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> updateCategory(int id, String name) async {
    emit(CategoryLoading());
    try {
      final category = await _getByIdUseCase(id);

      if (category == null) {
        emit(
          CategoryError('Categoria não encontrada', type: ErrorType.notFound),
        );
        return;
      }

      final updatedCategory = category.copyWith(
        name: name,
        updatedAt: DateTime.now(),
      );

      await _updateUseCase(updatedCategory);
      await loadCategories();
    } on ArgumentError catch (e) {
      emit(
        CategoryError(
          'Dados inválidos',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        CategoryError(
          'Erro ao atualizar categoria',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadCategories() async {
    emit(CategoryLoading());
    try {
      final categories = await _getAllUseCase();
      emit(CategoriesLoaded(categories));
    } on ArgumentError catch (e) {
      emit(
        CategoryError(
          'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        CategoryError(
          'Erro ao carregar categorias',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> deleteCategory(int id) async {
    emit(CategoryLoading());
    try {
      await _deleteUseCase(id);
      await loadCategories();
    } on ArgumentError catch (e) {
      emit(
        CategoryError(
          'ID inválido',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        CategoryError(
          'Erro ao deletar categoria',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }
}
