import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciamento_agricola/domain/entities/supplier_entity.dart';
import 'package:gerenciamento_agricola/domain/repositories/supplier_repository.dart';
import 'package:gerenciamento_agricola/domain/usecases/supplier_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockSupplierRepository extends Mock implements ISupplierRepository {}
class FakeSupplierEntity extends Fake implements SupplierEntity {}

void main() {
  late ISupplierRepository mockRepository;

  setUpAll(() {
    registerFallbackValue(FakeSupplierEntity());
  });

  setUp(() {
    mockRepository = MockSupplierRepository();
  });

  group('CreateSupplierUseCase', () {
    late CreateSupplierUseCase useCase;

    setUp(() {
      useCase = CreateSupplierUseCase(mockRepository);
    });

    test('should create supplier successfully', () async {
      // Arrange
      when(() => mockRepository.saveSupplier(any()))
          .thenAnswer((_) async => {});

      // Act
      await useCase('Fornecedor Teste', '(11) 98765-4321');

      // Assert
      verify(() => mockRepository.saveSupplier(any())).called(1);
    });

    test('should throw ArgumentError when name is invalid', () async {
      // Act & Assert
      expect(
        () => useCase('AB', null),
        throwsA(isA<ArgumentError>()),
      );
      verifyNever(() => mockRepository.saveSupplier(any()));
    });

    test('should throw Exception when repository fails', () async {
      // Arrange
      when(() => mockRepository.saveSupplier(any()))
          .thenThrow(Exception('Database error'));

      // Act & Assert
      expect(
        () => useCase('Fornecedor Teste', null),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('GetAllSuppliersUseCase', () {
    late GetAllSuppliersUseCase useCase;

    setUp(() {
      useCase = GetAllSuppliersUseCase(mockRepository);
    });

    test('should return list of suppliers', () async {
      // Arrange
      final suppliers = [
        SupplierEntity.create(name: 'Fornecedor 1', contactInfo: null),
        SupplierEntity.create(name: 'Fornecedor 2', contactInfo: null),
      ];
      when(() => mockRepository.getAllSuppliers())
          .thenAnswer((_) async => suppliers);

      // Act
      final result = await useCase();

      // Assert
      expect(result, suppliers);
      verify(() => mockRepository.getAllSuppliers()).called(1);
    });

    test('should throw Exception when repository fails', () async {
      // Arrange
      when(() => mockRepository.getAllSuppliers())
          .thenThrow(Exception('Database error'));

      // Act & Assert
      expect(() => useCase(), throwsA(isA<Exception>()));
    });
  });

  group('GetSupplierByIdUseCase', () {
    late GetSupplierByIdUseCase useCase;

    setUp(() {
      useCase = GetSupplierByIdUseCase(mockRepository);
    });

    test('should return supplier when found', () async {
      // Arrange
      final supplier = SupplierEntity.create(name: 'Fornecedor', contactInfo: null);
      when(() => mockRepository.getSupplierById(1))
          .thenAnswer((_) async => supplier);

      // Act
      final result = await useCase(1);

      // Assert
      expect(result, supplier);
      verify(() => mockRepository.getSupplierById(1)).called(1);
    });

    test('should throw ArgumentError when id is invalid', () async {
      // Act & Assert
      expect(() => useCase(0), throwsA(isA<ArgumentError>()));
      expect(() => useCase(-1), throwsA(isA<ArgumentError>()));
      verifyNever(() => mockRepository.getSupplierById(any()));
    });

    test('should return null when supplier not found', () async {
      // Arrange
      when(() => mockRepository.getSupplierById(999))
          .thenAnswer((_) async => null);

      // Act
      final result = await useCase(999);

      // Assert
      expect(result, isNull);
    });
  });

  group('UpdateSupplierUseCase', () {
    late UpdateSupplierUseCase useCase;

    setUp(() {
      useCase = UpdateSupplierUseCase(mockRepository);
    });

    test('should update supplier successfully', () async {
      // Arrange
      final supplier = SupplierEntity(
        id: 1,
        name: 'Fornecedor Atualizado',
        contactInfo: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      when(() => mockRepository.updateSupplier(supplier))
          .thenAnswer((_) async => {});

      // Act
      await useCase(supplier);

      // Assert
      verify(() => mockRepository.updateSupplier(supplier)).called(1);
    });

    test('should throw ArgumentError when supplier has no id', () async {
      // Arrange
      final supplier = SupplierEntity.create(name: 'Fornecedor', contactInfo: null);

      // Act & Assert
      expect(() => useCase(supplier), throwsA(isA<ArgumentError>()));
      verifyNever(() => mockRepository.updateSupplier(any()));
    });

    test('should throw Exception when repository fails', () async {
      // Arrange
      final supplier = SupplierEntity(
        id: 1,
        name: 'Fornecedor',
        contactInfo: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      when(() => mockRepository.updateSupplier(supplier))
          .thenThrow(Exception('Database error'));

      // Act & Assert
      expect(() => useCase(supplier), throwsA(isA<Exception>()));
    });
  });

  group('DeleteSupplierByIdUseCase', () {
    late DeleteSupplierByIdUseCase useCase;

    setUp(() {
      useCase = DeleteSupplierByIdUseCase(mockRepository);
    });

    test('should delete supplier successfully', () async {
      // Arrange
      when(() => mockRepository.deleteSupplier(1))
          .thenAnswer((_) async => {});

      // Act
      await useCase(1);

      // Assert
      verify(() => mockRepository.deleteSupplier(1)).called(1);
    });

    test('should throw ArgumentError when id is invalid', () async {
      // Act & Assert
      expect(() => useCase(0), throwsA(isA<ArgumentError>()));
      expect(() => useCase(-1), throwsA(isA<ArgumentError>()));
      verifyNever(() => mockRepository.deleteSupplier(any()));
    });

    test('should throw Exception when repository fails', () async {
      // Arrange
      when(() => mockRepository.deleteSupplier(1))
          .thenThrow(Exception('Database error'));

      // Act & Assert
      expect(() => useCase(1), throwsA(isA<Exception>()));
    });
  });

  group('SearchSuppliersByNameUseCase', () {
    late SearchSuppliersByNameUseCase useCase;

    setUp(() {
      useCase = SearchSuppliersByNameUseCase(mockRepository);
    });

    test('should return suppliers matching search query', () async {
      // Arrange
      final suppliers = [
        SupplierEntity.create(name: 'Fornecedor ABC', contactInfo: null),
        SupplierEntity.create(name: 'Fornecedor XYZ', contactInfo: null),
      ];
      when(() => mockRepository.searchSuppliersByName('Fornecedor'))
          .thenAnswer((_) async => suppliers);

      // Act
      final result = await useCase('Fornecedor');

      // Assert
      expect(result, suppliers);
      verify(() => mockRepository.searchSuppliersByName('Fornecedor')).called(1);
    });

    test('should throw ArgumentError when search term is too short', () async {
      // Act & Assert
      expect(() => useCase('A'), throwsA(isA<ArgumentError>()));
      expect(() => useCase(''), throwsA(isA<ArgumentError>()));
      verifyNever(() => mockRepository.searchSuppliersByName(any()));
    });

    test('should trim search query', () async {
      // Arrange
      when(() => mockRepository.searchSuppliersByName('Fornecedor'))
          .thenAnswer((_) async => []);

      // Act
      await useCase('  Fornecedor  ');

      // Assert
      verify(() => mockRepository.searchSuppliersByName('Fornecedor')).called(1);
    });

    test('should throw Exception when repository fails', () async {
      // Arrange
      when(() => mockRepository.searchSuppliersByName(any()))
          .thenThrow(Exception('Database error'));

      // Act & Assert
      expect(() => useCase('Test'), throwsA(isA<Exception>()));
    });
  });
}
