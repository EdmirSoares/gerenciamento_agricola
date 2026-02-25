import 'package:gerenciamento_agricola/domain/entities/supplier_entity.dart';

abstract class SupplierState {}

class SupplierInitial extends SupplierState {}

class SupplierLoading extends SupplierState {}

class SupplierSuccess extends SupplierState {}

class SuppliersLoaded extends SupplierState {
  final List<SupplierEntity> suppliers;
  SuppliersLoaded(this.suppliers);
}

class SupplierError extends SupplierState {
  final String message;
  final String? details;
  final ErrorType type;

  SupplierError(this.message, {this.details, this.type = ErrorType.generic});
}

enum ErrorType { validation, notFound, network, permission, generic }
