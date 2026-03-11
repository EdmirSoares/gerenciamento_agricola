import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_agricola/core/injection/service_locator.dart';
import 'package:gerenciamento_agricola/core/navigation/app_routes.dart';
import 'package:gerenciamento_agricola/presentation/cubits/category_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/products_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/simulation_cubit.dart';
import 'package:gerenciamento_agricola/presentation/pages/categories/categories_page.dart';
import 'package:gerenciamento_agricola/presentation/pages/dashboard/dashboard_page.dart';
import 'package:gerenciamento_agricola/presentation/pages/home_page.dart';
import 'package:gerenciamento_agricola/presentation/pages/products/product_detail_page.dart';
import 'package:gerenciamento_agricola/presentation/pages/products/product_form_page.dart';
import 'package:gerenciamento_agricola/presentation/pages/products/products_list_page.dart';
import 'package:gerenciamento_agricola/presentation/pages/simulation_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
    ValueNotifier<ThemeMode>? themeNotifier,
  ) {
    // final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.splash:
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => HomePage(themeNotifier: themeNotifier),
          settings: settings,
        );

      case AppRoutes.dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardPage(),
          settings: settings,
        );

      case AppRoutes.creditSimulation:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<SimulationCubit>(),
            child: const SimulationPage(),
          ),
          settings: settings,
        );

      case AppRoutes.categories:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<CategoryCubit>()..loadCategories(),
            child: const CategoriesPage(),
          ),
          settings: settings,
        );

      case AppRoutes.products:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<ProductsCubit>()..loadProducts()),
              BlocProvider(
                create: (_) => sl<CategoryCubit>()..loadCategories(),
              ),
            ],
            child: const ProductsListPage(),
          ),
          settings: settings,
        );

      case AppRoutes.productForm:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<ProductsCubit>()..loadProducts()),
              BlocProvider(
                create: (_) => sl<CategoryCubit>()..loadCategories(),
              ),
            ],
            child: const ProductFormPage(),
          ),
          settings: settings,
        );

      case AppRoutes.productDetail:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<ProductsCubit>()..loadProducts()),
            ],
            child: const ProductDetailPage(),
          ),
          settings: settings,
        );

      case AppRoutes.stock:
      case AppRoutes.stockList:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Estoque - Em Desenvolvimento')),
          ),
          settings: settings,
        );

      case AppRoutes.stockMovements:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Movimentações de Estoque - Em Desenvolvimento'),
            ),
          ),
          settings: settings,
        );

      case AppRoutes.production:
      case AppRoutes.productionList:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Produção - Em Desenvolvimento')),
          ),
          settings: settings,
        );

      case AppRoutes.purchases:
      case AppRoutes.purchasesList:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Compras - Em Desenvolvimento')),
          ),
          settings: settings,
        );

      case AppRoutes.financial:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Financeiro - Em Desenvolvimento')),
          ),
          settings: settings,
        );

      case AppRoutes.suppliers:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Fornecedores - Em Desenvolvimento')),
          ),
          settings: settings,
        );

      case AppRoutes.areas:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Áreas - Em Desenvolvimento')),
          ),
          settings: settings,
        );

      case AppRoutes.settings:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Configurações - Em Desenvolvimento')),
          ),
          settings: settings,
        );

      case AppRoutes.reports:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Relatórios - Em Desenvolvimento')),
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text('Erro 404')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Página não encontrada',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rota: ${settings.name}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.of(
                      context,
                    ).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false),
                    icon: const Icon(Icons.home),
                    label: const Text('Voltar para Início'),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }
}
