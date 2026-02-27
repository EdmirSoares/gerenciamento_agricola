import 'package:gerenciamento_agricola/data/repositories/category_repository_impl.dart';
import 'package:gerenciamento_agricola/data/repositories/products_repository_impl.dart';
import 'package:gerenciamento_agricola/data/repositories/simulation_repository_impl.dart';
import 'package:gerenciamento_agricola/data/repositories/stock_movements_impl.dart';
import 'package:gerenciamento_agricola/data/repositories/stock_repository_impl.dart';
import 'package:gerenciamento_agricola/data/repositories/supplier_repository_impl.dart';
import 'package:gerenciamento_agricola/data/repositories/purchase_repository_impl.dart';
import 'package:gerenciamento_agricola/data/repositories/purchase_item_repository_impl.dart';
import 'package:gerenciamento_agricola/data/repositories/area_repository_impl.dart';
import 'package:gerenciamento_agricola/data/repositories/production_repository_impl.dart';
import 'package:gerenciamento_agricola/domain/repositories/category_repository.dart';
import 'package:gerenciamento_agricola/domain/repositories/products_repository.dart';
import 'package:gerenciamento_agricola/domain/repositories/simulation_repository.dart';
import 'package:gerenciamento_agricola/domain/repositories/stock_movements_repository.dart';
import 'package:gerenciamento_agricola/domain/repositories/stock_repository.dart';
import 'package:gerenciamento_agricola/domain/repositories/supplier_repository.dart';
import 'package:gerenciamento_agricola/domain/repositories/purchase_repository.dart';
import 'package:gerenciamento_agricola/domain/repositories/purchase_item_repository.dart';
import 'package:gerenciamento_agricola/domain/repositories/area_repository.dart';
import 'package:gerenciamento_agricola/domain/repositories/production_repository.dart';
import 'package:gerenciamento_agricola/domain/usecases/category_usecase.dart';
import 'package:gerenciamento_agricola/domain/usecases/products_usecase.dart';
import 'package:gerenciamento_agricola/domain/usecases/stock_movements_usecase.dart';
import 'package:gerenciamento_agricola/domain/usecases/stock_usecase.dart';
import 'package:gerenciamento_agricola/domain/usecases/supplier_usecase.dart';
import 'package:gerenciamento_agricola/domain/usecases/purchase_usecase.dart';
import 'package:gerenciamento_agricola/domain/usecases/purchase_item_usecase.dart';
import 'package:gerenciamento_agricola/domain/usecases/area_usecase.dart';
import 'package:gerenciamento_agricola/domain/usecases/production_usecase.dart';
import 'package:gerenciamento_agricola/presentation/cubits/category_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/products_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/simulation_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/stock_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/stock_movements/stock_movements_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/supplier_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/purchase_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/purchase_item_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/area_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/production_cubit.dart';

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

  sl.registerLazySingleton<IStockMovementsRepository>(
    () => StockMovementsImpl(sl<AppDatabase>()),
  );

  sl.registerLazySingleton<ISupplierRepository>(
    () => SupplierRepositoryImpl(sl<AppDatabase>()),
  );

  sl.registerLazySingleton<IPurchaseRepository>(
    () => PurchaseRepositoryImpl(sl<AppDatabase>()),
  );

  sl.registerLazySingleton<IPurchaseItemRepository>(
    () => PurchaseItemRepositoryImpl(sl<AppDatabase>()),
  );

  sl.registerLazySingleton<IAreaRepository>(
    () => AreaRepositoryImpl(sl<AppDatabase>()),
  );

  sl.registerLazySingleton<IProductionRepository>(
    () => ProductionRepositoryImpl(sl<AppDatabase>()),
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

  // UseCases - Supplier
  sl.registerLazySingleton(() => CreateSupplierUseCase(sl()));
  sl.registerLazySingleton(() => GetAllSuppliersUseCase(sl()));
  sl.registerLazySingleton(() => GetSupplierByIdUseCase(sl()));
  sl.registerLazySingleton(() => UpdateSupplierUseCase(sl()));
  sl.registerLazySingleton(() => DeleteSupplierByIdUseCase(sl()));
  sl.registerLazySingleton(() => SearchSuppliersByNameUseCase(sl()));

  // UseCases - Purchase
  sl.registerLazySingleton(() => CreatePurchaseUseCase(sl()));
  sl.registerLazySingleton(() => GetAllPurchasesUseCase(sl()));
  sl.registerLazySingleton(() => GetPurchaseByIdUseCase(sl()));
  sl.registerLazySingleton(() => GetPurchasesBySupplierUseCase(sl()));
  sl.registerLazySingleton(() => GetPendingPurchasesUseCase(sl()));
  sl.registerLazySingleton(() => GetOverduePurchasesUseCase(sl()));
  sl.registerLazySingleton(() => GetPaidPurchasesUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePurchaseUseCase(sl()));
  sl.registerLazySingleton(() => DeletePurchaseByIdUseCase(sl()));
  sl.registerLazySingleton(() => MarkPurchaseAsPaidUseCase(sl()));

  // UseCases - PurchaseItem
  sl.registerLazySingleton(() => CreatePurchaseItemUseCase(sl()));
  sl.registerLazySingleton(() => GetAllPurchaseItemsUseCase(sl()));
  sl.registerLazySingleton(() => GetItemsByPurchaseIdUseCase(sl()));
  sl.registerLazySingleton(() => GetItemsByProductIdUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePurchaseItemUseCase(sl()));
  sl.registerLazySingleton(() => DeletePurchaseItemByIdUseCase(sl()));

  // UseCases - Area
  sl.registerLazySingleton(() => CreateAreaUseCase(sl()));
  sl.registerLazySingleton(() => GetAllAreasUseCase(sl()));
  sl.registerLazySingleton(() => SearchAreasByNameUseCase(sl()));
  sl.registerLazySingleton(() => UpdateAreaUseCase(sl()));
  sl.registerLazySingleton(() => DeleteAreaByIdUseCase(sl()));

  // UseCases - Production
  sl.registerLazySingleton(() => CreateProductionUseCase(sl()));
  sl.registerLazySingleton(() => GetAllProductionsUseCase(sl()));
  sl.registerLazySingleton(() => GetProductionsByProductIdUseCase(sl()));
  sl.registerLazySingleton(() => GetProductionsByAreaIdUseCase(sl()));
  sl.registerLazySingleton(() => GetProductionsByDateRangeUseCase(sl()));
  sl.registerLazySingleton(() => GetProfitableProductionsUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProductionUseCase(sl()));
  sl.registerLazySingleton(() => DeleteProductionByIdUseCase(sl()));

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
      sl(), // GetAllProductsUseCase
      sl(), // GetProductByIdUseCase
      sl(), // GetProductsByCategoryIdUseCase
      sl(), // GetProductsByNameUseCase
      sl(), // GetProductionProductsUseCase
      sl(), // UpdateProductUseCase
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

  sl.registerFactory(
    () => SupplierCubit(
      sl(), // CreateSupplierUseCase
      sl(), // GetAllSuppliersUseCase
      sl(), // GetSupplierByIdUseCase
      sl(), // UpdateSupplierUseCase
      sl(), // DeleteSupplierByIdUseCase
      sl(), // SearchSuppliersByNameUseCase
    ),
  );

  sl.registerFactory(
    () => PurchaseCubit(
      sl(), // CreatePurchaseUseCase
      sl(), // GetAllPurchasesUseCase
      sl(), // GetPurchaseByIdUseCase
      sl(), // GetPurchasesBySupplierUseCase
      sl(), // GetPendingPurchasesUseCase
      sl(), // GetOverduePurchasesUseCase
      sl(), // GetPaidPurchasesUseCase
      sl(), // UpdatePurchaseUseCase
      sl(), // DeletePurchaseByIdUseCase
      sl(), // MarkPurchaseAsPaidUseCase
    ),
  );

  sl.registerFactory(
    () => PurchaseItemCubit(
      sl(), // CreatePurchaseItemUseCase
      sl(), // GetAllPurchaseItemsUseCase
      sl(), // GetItemsByPurchaseIdUseCase
      sl(), // GetItemsByProductIdUseCase
      sl(), // UpdatePurchaseItemUseCase
      sl(), // DeletePurchaseItemByIdUseCase
    ),
  );

  sl.registerFactory(
    () => AreaCubit(
      sl(), // CreateAreaUseCase
      sl(), // GetAllAreasUseCase
      sl(), // SearchAreasByNameUseCase
      sl(), // UpdateAreaUseCase
      sl(), // DeleteAreaByIdUseCase
    ),
  );

  sl.registerFactory(
    () => ProductionCubit(
      sl(), // CreateProductionUseCase
      sl(), // GetAllProductionsUseCase
      sl(), // GetProductionsByProductIdUseCase
      sl(), // GetProductionsByAreaIdUseCase
      sl(), // GetProductionsByDateRangeUseCase
      sl(), // GetProfitableProductionsUseCase
      sl(), // UpdateProductionUseCase
      sl(), // DeleteProductionByIdUseCase
    ),
  );
}
