import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/area_entity.dart';
import '../../domain/usecases/area_usecase.dart';
import '../widgets/error_display_widget.dart';
import 'area_state.dart';

class AreaCubit extends Cubit<AreaState> {
  final CreateAreaUseCase _createAreaUseCase;
  final GetAllAreasUseCase _getAllAreasUseCase;
  final SearchAreasByNameUseCase _searchAreasByNameUseCase;
  final UpdateAreaUseCase _updateAreaUseCase;
  final DeleteAreaByIdUseCase _deleteAreaByIdUseCase;

  AreaCubit(
    this._createAreaUseCase,
    this._getAllAreasUseCase,
    this._searchAreasByNameUseCase,
    this._updateAreaUseCase,
    this._deleteAreaByIdUseCase,
  ) : super(AreaInitial());

  Future<void> createArea(AreaEntity area) async {
    emit(AreaLoading());
    try {
      await _createAreaUseCase(area);
      emit(AreaSuccess('Área criada com sucesso'));
      await loadAllAreas();
    } on ArgumentError catch (e) {
      emit(
        AreaError(
          message: 'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        AreaError(
          message: 'Falha ao criar a área',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> updateArea(AreaEntity area) async {
    emit(AreaLoading());
    try {
      await _updateAreaUseCase(area);
      emit(AreaSuccess('Área atualizada com sucesso'));
      await loadAllAreas();
    } on ArgumentError catch (e) {
      emit(
        AreaError(
          message: 'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        AreaError(
          message: 'Falha ao atualizar a área',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> loadAllAreas() async {
    emit(AreaLoading());
    try {
      final areas = await _getAllAreasUseCase();
      emit(AreasLoaded(areas));
    } catch (e) {
      emit(
        AreaError(
          message: 'Falha ao carregar as áreas',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> searchAreasByName(String name) async {
    emit(AreaLoading());
    try {
      final areas = await _searchAreasByNameUseCase(name);
      emit(AreasLoaded(areas));
    } on ArgumentError catch (e) {
      emit(
        AreaError(
          message: 'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        AreaError(
          message: 'Falha ao buscar áreas',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }

  Future<void> deleteArea(int id) async {
    emit(AreaLoading());
    try {
      await _deleteAreaByIdUseCase(id);
      emit(AreaSuccess('Área deletada com sucesso'));
      await loadAllAreas();
    } on ArgumentError catch (e) {
      emit(
        AreaError(
          message: 'Erro de validação',
          details: e.message,
          type: ErrorType.validation,
        ),
      );
    } catch (e) {
      emit(
        AreaError(
          message: 'Falha ao deletar a área',
          details: e.toString(),
          type: ErrorType.generic,
        ),
      );
    }
  }
}
