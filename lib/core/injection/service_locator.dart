import 'package:gerenciamento_agricola/data/repositories/category_repository_impl.dart';
import 'package:gerenciamento_agricola/data/repositories/products-repository_impl.dart';
import 'package:gerenciamento_agricola/data/repositories/simulation_repository_impl.dart';
import 'package:gerenciamento_agricola/domain/repositories/category_repository.dart';
import 'package:gerenciamento_agricola/domain/repositories/products_repository.dart';
import 'package:gerenciamento_agricola/domain/repositories/simulation_repository.dart';
import 'package:gerenciamento_agricola/domain/usecases/category_usecase.dart';
import 'package:gerenciamento_agricola/presentation/cubits/simulation_cubit.dart';

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

  // UseCases
  sl.registerLazySingleton(() => CalculateCreditUseCase());

  sl.registerLazySingleton(() => CreateCategoryUseCase(sl()));

  // Cubits
  sl.registerFactory(() => SimulationCubit(sl(), sl()));
}
