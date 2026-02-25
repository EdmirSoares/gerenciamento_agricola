import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciamento_agricola/domain/entities/supplier_entity.dart';

void main() {
  group('SupplierEntity', () {
    group('create factory', () {
      test('should create valid supplier with required fields', () {
        // Arrange & Act
        final supplier = SupplierEntity.create(
          name: 'Fornecedor Teste',
          contactInfo: '(11) 98765-4321',
        );

        // Assert
        expect(supplier.name, 'Fornecedor Teste');
        expect(supplier.contactInfo, '(11) 98765-4321');
        expect(supplier.isDeleted, false);
        expect(supplier.id, isNull);
        expect(supplier.createdAt, isNotNull);
        expect(supplier.updatedAt, isNotNull);
      });

      test('should trim whitespace from name and contactInfo', () {
        // Arrange & Act
        final supplier = SupplierEntity.create(
          name: '  Fornecedor Teste  ',
          contactInfo: '  (11) 98765-4321  ',
        );

        // Assert
        expect(supplier.name, 'Fornecedor Teste');
        expect(supplier.contactInfo, '(11) 98765-4321');
      });

      test('should set contactInfo to null if empty or whitespace', () {
        // Arrange & Act
        final supplier1 = SupplierEntity.create(
          name: 'Fornecedor Teste',
          contactInfo: '   ',
        );
        final supplier2 = SupplierEntity.create(
          name: 'Fornecedor Teste',
          contactInfo: null,
        );

        // Assert
        expect(supplier1.contactInfo, isNull);
        expect(supplier2.contactInfo, isNull);
      });

      test('should throw ArgumentError when name is empty', () {
        // Arrange, Act & Assert
        expect(
          () => SupplierEntity.create(name: '', contactInfo: null),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('should throw ArgumentError when name has less than 3 characters', () {
        // Arrange, Act & Assert
        expect(
          () => SupplierEntity.create(name: 'AB', contactInfo: null),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('should throw ArgumentError when name is only whitespace', () {
        // Arrange, Act & Assert
        expect(
          () => SupplierEntity.create(name: '   ', contactInfo: null),
          throwsA(isA<ArgumentError>()),
        );
      });
    });

    group('copyWith', () {
      test('should create copy with updated fields', () {
        // Arrange
        final original = SupplierEntity.create(
          name: 'Fornecedor Original',
          contactInfo: '111',
        );

        // Act
        final updated = original.copyWith(
          name: 'Fornecedor Atualizado',
          contactInfo: '222',
        );

        // Assert
        expect(updated.name, 'Fornecedor Atualizado');
        expect(updated.contactInfo, '222');
        expect(updated.createdAt, original.createdAt);
      });

      test('should keep original values when not provided', () {
        // Arrange
        final original = SupplierEntity.create(
          name: 'Fornecedor Original',
          contactInfo: '111',
        );

        // Act
        final copy = original.copyWith(id: original.id);

        // Assert
        expect(copy.name, original.name);
        expect(copy.contactInfo, original.contactInfo);
        expect(copy.createdAt, original.createdAt);
      });

      test('should throw ArgumentError when new name is invalid', () {
        // Arrange
        final supplier = SupplierEntity.create(
          name: 'Fornecedor Teste',
          contactInfo: null,
        );

        // Act & Assert
        expect(
          () => supplier.copyWith(name: 'AB'),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('should trim whitespace from new values', () {
        // Arrange
        final supplier = SupplierEntity.create(
          name: 'Fornecedor Original',
          contactInfo: null,
        );

        // Act
        final updated = supplier.copyWith(
          name: '  Fornecedor Novo  ',
          contactInfo: '  Contato  ',
        );

        // Assert
        expect(updated.name, 'Fornecedor Novo');
        expect(updated.contactInfo, 'Contato');
      });

      test('should set contactInfo to null if empty string', () {
        // Arrange
        final supplier = SupplierEntity.create(
          name: 'Fornecedor Teste',
          contactInfo: 'Contato Original',
        );

        // Act
        final updated = supplier.copyWith(contactInfo: '   ');

        // Assert
        expect(updated.contactInfo, isNull);
      });
    });

    group('getters', () {
      test('isValid should return true for valid supplier', () {
        // Arrange
        final supplier = SupplierEntity.create(
          name: 'Fornecedor Válido',
          contactInfo: null,
        );

        // Act & Assert
        expect(supplier.isValid, true);
      });

      test('hasContactInfo should return true when contactInfo exists', () {
        // Arrange
        final supplierWithContact = SupplierEntity.create(
          name: 'Fornecedor',
          contactInfo: '(11) 1234-5678',
        );
        final supplierWithoutContact = SupplierEntity.create(
          name: 'Fornecedor',
          contactInfo: null,
        );

        // Act & Assert
        expect(supplierWithContact.hasContactInfo, true);
        expect(supplierWithoutContact.hasContactInfo, false);
      });

      test('hasContactInfo should return false when contactInfo is empty', () {
        // Arrange - create manually to bypass factory validation
        final supplier = SupplierEntity(
          name: 'Fornecedor',
          contactInfo: '',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // Act & Assert
        expect(supplier.hasContactInfo, false);
      });
    });
  });
}
