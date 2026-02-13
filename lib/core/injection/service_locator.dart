import 'package:gerenciamento_agricola/data/repositories/simulation_repository_impl.dart';
import 'package:gerenciamento_agricola/domain/repositories/simulation_repository.dart';
import 'package:gerenciamento_agricola/presentation/cubits/simulation_cubit.dart';

import '../../data/database/app_database.dart';
import '../../domain/usecases/calculate_credit_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setup() {
  // Database Singleton
  sl.registerSingleton<AppDatabase>(AppDatabase());

  // Repositories (O contrato aponta para a implementação)
  sl.registerLazySingleton<ISimulationRepository>(
    () => SimulationRepositoryImpl(sl<AppDatabase>()),
  );

  // UseCases
  sl.registerLazySingleton(() => CalculateCreditUseCase());

  // Cubits
  sl.registerFactory(() => SimulationCubit(sl(), sl()));
}
