import '../../domain/entities/area_entity.dart';
import '../widgets/error_display_widget.dart';

abstract class AreaState {}

class AreaInitial extends AreaState {}

class AreaLoading extends AreaState {}

class AreaSuccess extends AreaState {
  final String message;
  AreaSuccess(this.message);
}

class AreasLoaded extends AreaState {
  final List<AreaEntity> areas;

  AreasLoaded(this.areas);
}

class AreaError extends AreaState implements AppError {
  @override
  final String message;
  @override
  final String? details;
  @override
  final ErrorType type;

  AreaError({
    required this.message,
    this.details,
    this.type = ErrorType.generic,
  });
}
