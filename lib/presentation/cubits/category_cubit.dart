import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_agricola/domain/usecases/category_usecase.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CreateCategoryUseCase _createUseCase;
  final GetAllCategoriesUseCase _getAllUseCase;
  
  CategoryCubit(this._createUseCase, this._getAllUseCase) 
    : super(CategoryInitial());
  
  Future<void> createCategory(String name) async {
    emit(CategoryLoading());
    try {
      await _createUseCase(name);
      emit(CategorySuccess());
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
  
  Future<void> loadCategories() async {
    emit(CategoryLoading());
    try {
      final categories = await _getAllUseCase();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}