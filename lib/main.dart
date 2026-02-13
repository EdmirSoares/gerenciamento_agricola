import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_agricola/core/injection/service_locator.dart';
import 'package:gerenciamento_agricola/presentation/cubits/simulation_cubit.dart';
import 'package:gerenciamento_agricola/presentation/pages/simulation_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulador Agrícola',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => sl<SimulationCubit>(),
        child: const SimulationPage(),
      ),
    );
  }
}

