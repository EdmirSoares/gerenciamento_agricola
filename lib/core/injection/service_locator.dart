import 'package:gerenciamento_agricola/data/repositories/category_repository_impl.dart';
import 'package:gerenciamento_agricola/data/repositories/products_repository_impl.dart';
import 'package:gerenciamento_agricola/data/repositories/simulation_repository_impl.dart';
import 'package:gerenciamento_agricola/data/repositories/stock_repository_impl.dart';
import 'package:gerenciamento_agricola/domain/repositories/category_repository.dart';
import 'package:gerenciamento_agricola/domain/repositories/products_repository.dart';
import 'package:gerenciamento_agricola/domain/repositories/simulation_repository.dart';
import 'package:gerenciamento_agricola/domain/repositories/stock_repository.dart';
import 'package:gerenciamento_agricola/domain/usecases/category_usecase.dart';
import 'package:gerenciamento_agricola/domain/usecases/products_usecase.dart';
import 'package:gerenciamento_agricola/domain/usecases/stock_movements_usecase.dart';
import 'package:gerenciamento_agricola/domain/usecases/stock_usecase.dart';
import 'package:gerenciamento_agricola/presentation/cubits/category_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/products_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/simulation_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/stock_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/stock_movements/stock_movements_cubit.dart';

import '../../data/database/app_database.dart';
import '../../domain/usecases/calculate_credit_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setup() {
  // Database Singleton
  sl.registerSingleton<AppDatabase>(AppDatabase());

  sl.registerLazySingleton<ISimulationRepository>(
    () => SimulationRepositoryImpl(sl<AppDatabase>()),
  );

  sl.registerLazySingleton<ICategoryRepository>(
    () => CategoryRepositoryImpl(sl<AppDatabase>()),
  );

  sl.registerLazySingleton<IProductRepository>(
    () => ProductsRepositoryImpl(sl<AppDatabase>()),
  );

  sl.registerLazySingleton<IStockRepository>(
    () => StockRepositoryImpl(sl<AppDatabase>()),
  );

  // UseCases - Simulation
  sl.registerLazySingleton(() => CalculateCreditUseCase());

  // UseCases - Category
  sl.registerLazySingleton(() => CreateCategoryUseCase(sl()));
  sl.registerLazySingleton(() => GetAllCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => GetCategoryByIdUseCase(sl()));
  sl.registerLazySingleton(() => UpdateCategoryUseCase(sl()));
  sl.registerLazySingleton(() => DeleteCategoryByIdUseCase(sl()));

  // UseCases - Products
  sl.registerLazySingleton(() => CreateProductUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProductUseCase(sl()));
  sl.registerLazySingleton(() => GetAllProductsUseCase(sl()));
  sl.registerLazySingleton(() => GetProductByIdUseCase(sl()));
  sl.registerLazySingleton(() => GetProductsByCategoryIdUseCase(sl()));
  sl.registerLazySingleton(() => GetProductsByNameUseCase(sl()));
  sl.registerLazySingleton(() => GetProductionProductsUseCase(sl()));
  sl.registerLazySingleton(() => DeleteProductByIdUseCase(sl()));

  // UseCases - Stock
  sl.registerLazySingleton(() => AddStockUseCase(sl()));
  sl.registerLazySingleton(() => UpdateStockUseCase(sl()));
  sl.registerLazySingleton(() => GetAllStockUseCase(sl()));
  sl.registerLazySingleton(() => GetStockByIdUseCase(sl()));
  sl.registerLazySingleton(() => GetStockByProductIdUseCase(sl()));
  sl.registerLazySingleton(() => GetStockBelowQuantityUseCase(sl()));
  sl.registerLazySingleton(() => GetStockExpiringWithinUseCase(sl()));
  sl.registerLazySingleton(() => SearchStockByProductNameUseCase(sl()));
  sl.registerLazySingleton(() => DeleteStockByIdUseCase(sl()));
  sl.registerLazySingleton(() => DeleteExpiredStockUseCase(sl()));
  sl.registerLazySingleton(() => DeleteStockBelowQuantityUseCase(sl()));

// UseCases - Stock Movements
sl.registerLazySingleton(() => AddStockMovementUseCase(sl()));
sl.registerLazySingleton(() => UpdateStockMovementUseCase(sl()));
sl.registerLazySingleton(() => DeleteStockMovementsUseCase(sl()));
sl.registerLazySingleton(() => GetAllStockMovementsUseCase(sl()));
sl.registerLazySingleton(() => GetStockMovementByIdUseCase(sl()));
sl.registerLazySingleton(() => GetMovementsByProductIdUseCase(sl()));
sl.registerLazySingleton(() => GetMovementsByTypeUseCase(sl()));
sl.registerLazySingleton(() => GetMovementsByDateRangeUseCase(sl()));
sl.registerLazySingleton(() => SearchMovementsByProductNameUseCase(sl()));
sl.registerLazySingleton(() => GetMovementsByCategoryUseCase(sl()));

  // Cubits
  sl.registerFactory(() => SimulationCubit(sl(), sl()));
  sl.registerFactory(
    () => CategoryCubit(
      sl(), // CreateCategoryUseCase
      sl(), // GetAllCategoriesUseCase
      sl(), // GetCategoryByIdUseCase
      sl(), // UpdateCategoryUseCase
      sl(), // DeleteCategoryByIdUseCase
    ),
  );
  sl.registerFactory(
    () => ProductsCubit(
      sl(), // CreateProductUseCase
      sl(), // UpdateProductUseCase
      sl(), // GetAllProductsUseCase
      sl(), // GetProductByIdUseCase
      sl(), // GetProductsByCategoryIdUseCase
      sl(), // GetProductsByNameUseCase
      sl(), // GetProductionProductsUseCase
      sl(), // DeleteProductByIdUseCase
    ),
  );
  sl.registerFactory(
    () => StockCubit(
      sl(), // AddStockUseCase
      sl(), // UpdateStockUseCase
      sl(), // GetAllStockUseCase
      sl(), // GetStockByIdUseCase
      sl(), // GetStockByProductIdUseCase
      sl(), // GetStockBelowQuantityUseCase
      sl(), // GetStockExpiringWithinUseCase
      sl(), // SearchStockByProductNameUseCase
      sl(), // DeleteStockByIdUseCase
      sl(), // DeleteExpiredStockUseCase
      sl(), // DeleteStockBelowQuantityUseCase
    ),
  );

  sl.registerFactory(
    () => StockMovementsCubit(
      sl(), // AddStockMovementUseCase
      sl(), // UpdateStockMovementUseCase
      sl(), // DeleteStockMovementsUseCase
      sl(), // GetAllStockMovementsUseCase
      sl(), // GetStockMovementByIdUseCase
      sl(), // GetMovementsByProductIdUseCase
      sl(), // GetMovementsByTypeUseCase
      sl(), // GetMovementsByDateRangeUseCase
      sl(), // SearchMovementsByProductNameUseCase
      sl(), // GetMovementsByCategoryUseCase
    ),
  );
}
