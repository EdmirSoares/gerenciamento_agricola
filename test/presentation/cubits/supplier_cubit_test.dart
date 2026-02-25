import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciamento_agricola/domain/entities/supplier_entity.dart';
import 'package:gerenciamento_agricola/domain/usecases/supplier_usecase.dart';
import 'package:gerenciamento_agricola/presentation/cubits/supplier_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/supplier_state.dart';
import 'package:mocktail/mocktail.dart';

class MockCreateSupplierUseCase extends Mock implements CreateSupplierUseCase {}
class MockUpdateSupplierUseCase extends Mock implements UpdateSupplierUseCase {}
class MockDeleteSupplierByIdUseCase extends Mock implements DeleteSupplierByIdUseCase {}
class MockGetAllSuppliersUseCase extends Mock implements GetAllSuppliersUseCase {}
class MockGetSupplierByIdUseCase extends Mock implements GetSupplierByIdUseCase {}
class MockSearchSuppliersByNameUseCase extends Mock implements SearchSuppliersByNameUseCase {}
class FakeSupplierEntity extends Fake implements SupplierEntity {}

void main() {
  late SupplierCubit cubit;
  late MockCreateSupplierUseCase mockCreateUseCase;
  late MockUpdateSupplierUseCase mockUpdateUseCase;
  late MockDeleteSupplierByIdUseCase mockDeleteUseCase;
  late MockGetAllSuppliersUseCase mockGetAllUseCase;
  late MockGetSupplierByIdUseCase mockGetByIdUseCase;
  late MockSearchSuppliersByNameUseCase mockSearchByNameUseCase;

  setUpAll(() {
    registerFallbackValue(FakeSupplierEntity());
  });

  setUp(() {
    mockCreateUseCase = MockCreateSupplierUseCase();
    mockUpdateUseCase = MockUpdateSupplierUseCase();
    mockDeleteUseCase = MockDeleteSupplierByIdUseCase();
    mockGetAllUseCase = MockGetAllSuppliersUseCase();
    mockGetByIdUseCase = MockGetSupplierByIdUseCase();
    mockSearchByNameUseCase = MockSearchSuppliersByNameUseCase();

    cubit = SupplierCubit(
      mockCreateUseCase,
      mockGetAllUseCase,
      mockGetByIdUseCase,
      mockUpdateUseCase,
      mockDeleteUseCase,
      mockSearchByNameUseCase,
    );
  });

  tearDown(() {
    cubit.close();
  });

  group('SupplierCubit', () {
    final testSuppliers = [
      SupplierEntity.create(name: 'Fornecedor 1', contactInfo: null),
      SupplierEntity.create(name: 'Fornecedor 2', contactInfo: '111'),
    ];

    test('initial state is SupplierInitial', () {
      expect(cubit.state, isA<SupplierInitial>());
    });

    group('createSupplier', () {
      blocTest<SupplierCubit, SupplierState>(
        'emits [SupplierLoading, SuppliersLoaded] when creation succeeds',
        build: () {
          when(() => mockCreateUseCase(any(), any()))
              .thenAnswer((_) async => {});
          when(() => mockGetAllUseCase())
              .thenAnswer((_) async => testSuppliers);
          return cubit;
        },
        act: (cubit) => cubit.createSupplier('Novo Fornecedor', '123'),
        expect: () => [
          isA<SupplierLoading>(),
          isA<SuppliersLoaded>(),
        ],
        verify: (_) {
          verify(() => mockCreateUseCase('Novo Fornecedor', '123')).called(1);
          verify(() => mockGetAllUseCase()).called(1);
        },
      );

      blocTest<SupplierCubit, SupplierState>(
        'emits [SupplierLoading, SupplierError] with validation type when ArgumentError occurs',
        build: () {
          when(() => mockCreateUseCase(any(), any()))
              .thenThrow(ArgumentError('Nome inválido'));
          return cubit;
        },
        act: (cubit) => cubit.createSupplier('AB', null),
        expect: () => [
          isA<SupplierError>().having(
            (e) => e.type,
            'type',
            ErrorType.validation,
          ),
        ],
      );

      blocTest<SupplierCubit, SupplierState>(
        'emits [SupplierLoading, SupplierError] with generic type when other error occurs',
        build: () {
          when(() => mockCreateUseCase(any(), any()))
              .thenThrow(Exception('Database error'));
          return cubit;
        },
        act: (cubit) => cubit.createSupplier('Fornecedor', null),
        expect: () => [
          isA<SupplierError>().having(
            (e) => e.type,
            'type',
            ErrorType.generic,
          ),
        ],
      );
    });

    group('updateSupplier', () {
      final existingSupplier = SupplierEntity(
        id: 1,
        name: 'Fornecedor Antigo',
        contactInfo: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      blocTest<SupplierCubit, SupplierState>(
        'emits [SupplierLoading, SuppliersLoaded] when update succeeds',
        build: () {
          when(() => mockGetByIdUseCase(1))
              .thenAnswer((_) async => existingSupplier);
          when(() => mockUpdateUseCase(any()))
              .thenAnswer((_) async => {});
          when(() => mockGetAllUseCase())
              .thenAnswer((_) async => testSuppliers);
          return cubit;
        },
        act: (cubit) => cubit.updateSupplier(1, 'Fornecedor Novo', '123'),
        expect: () => [
          isA<SupplierLoading>(),
          isA<SuppliersLoaded>(),
        ],
        verify: (_) {
          verify(() => mockGetByIdUseCase(1)).called(1);
          verify(() => mockUpdateUseCase(any())).called(1);
          verify(() => mockGetAllUseCase()).called(1);
        },
      );

      blocTest<SupplierCubit, SupplierState>(
        'emits [SupplierLoading, SupplierError] with notFound type when supplier not found',
        build: () {
          when(() => mockGetByIdUseCase(999))
              .thenAnswer((_) async => null);
          return cubit;
        },
        act: (cubit) => cubit.updateSupplier(999, 'Nome', null),
        expect: () => [
          isA<SupplierError>().having(
            (e) => e.type,
            'type',
            ErrorType.notFound,
          ),
        ],
      );

      blocTest<SupplierCubit, SupplierState>(
        'emits [SupplierLoading, SupplierError] with validation type when validation fails',
        build: () {
          when(() => mockGetByIdUseCase(1))
              .thenAnswer((_) async => existingSupplier);
          return cubit;
        },
        act: (cubit) => cubit.updateSupplier(1, 'AB', null),
        expect: () => [
          isA<SupplierError>().having(
            (e) => e.type,
            'type',
            ErrorType.validation,
          ),
        ],
      );
    });

    group('loadSuppliers', () {
      blocTest<SupplierCubit, SupplierState>(
        'emits [SupplierLoading, SuppliersLoaded] when loading succeeds',
        build: () {
          when(() => mockGetAllUseCase())
              .thenAnswer((_) async => testSuppliers);
          return cubit;
        },
        act: (cubit) => cubit.loadSuppliers(),
        expect: () => [
          isA<SupplierLoading>(),
          isA<SuppliersLoaded>()
              .having((s) => s.suppliers.length, 'suppliers length', 2),
        ],
      );

      blocTest<SupplierCubit, SupplierState>(
        'emits [SupplierLoading, SupplierError] when loading fails',
        build: () {
          when(() => mockGetAllUseCase())
              .thenThrow(Exception('Database error'));
          return cubit;
        },
        act: (cubit) => cubit.loadSuppliers(),
        expect: () => [
          isA<SupplierLoading>(),
          isA<SupplierError>().having(
            (e) => e.type,
            'type',
            ErrorType.generic,
          ),
        ],
      );
    });

    group('searchSuppliersByName', () {
      blocTest<SupplierCubit, SupplierState>(
        'emits [SupplierLoading, SuppliersLoaded] when search succeeds',
        build: () {
          when(() => mockSearchByNameUseCase(any()))
              .thenAnswer((_) async => [testSuppliers[0]]);
          return cubit;
        },
        act: (cubit) => cubit.searchSuppliersByName('Fornecedor'),
        expect: () => [
          isA<SupplierLoading>(),
          isA<SuppliersLoaded>()
              .having((s) => s.suppliers.length, 'suppliers length', 1),
        ],
      );

      blocTest<SupplierCubit, SupplierState>(
        'emits [SupplierLoading, SupplierError] with validation type when search term is invalid',
        build: () {
          when(() => mockSearchByNameUseCase(any()))
              .thenThrow(ArgumentError('Nome muito curto'));
          return cubit;
        },
        act: (cubit) => cubit.searchSuppliersByName('A'),
        expect: () => [
          isA<SupplierLoading>(),
          isA<SupplierError>().having(
            (e) => e.type,
            'type',
            ErrorType.validation,
          ),
        ],
      );
    });

    group('deleteSupplier', () {
      blocTest<SupplierCubit, SupplierState>(
        'emits [SupplierLoading, SuppliersLoaded] when deletion succeeds',
        build: () {
          when(() => mockDeleteUseCase(1))
              .thenAnswer((_) async => {});
          when(() => mockGetAllUseCase())
              .thenAnswer((_) async => testSuppliers);
          return cubit;
        },
        act: (cubit) => cubit.deleteSupplier(1),
        expect: () => [
          isA<SupplierLoading>(),
          isA<SuppliersLoaded>(),
        ],
        verify: (_) {
          verify(() => mockDeleteUseCase(1)).called(1);
          verify(() => mockGetAllUseCase()).called(1);
        },
      );

      blocTest<SupplierCubit, SupplierState>(
        'emits [SupplierLoading, SupplierError] with validation type when id is invalid',
        build: () {
          when(() => mockDeleteUseCase(any()))
              .thenThrow(ArgumentError('ID inválido'));
          return cubit;
        },
        act: (cubit) => cubit.deleteSupplier(0),
        expect: () => [
          isA<SupplierError>().having(
            (e) => e.type,
            'type',
            ErrorType.validation,
          ),
        ],
      );

      blocTest<SupplierCubit, SupplierState>(
        'emits [SupplierLoading, SupplierError] with generic type when deletion fails',
        build: () {
          when(() => mockDeleteUseCase(1))
              .thenThrow(Exception('Database error'));
          return cubit;
        },
        act: (cubit) => cubit.deleteSupplier(1),
        expect: () => [
          isA<SupplierError>().having(
            (e) => e.type,
            'type',
            ErrorType.generic,
          ),
        ],
      );
    });
  });
}
