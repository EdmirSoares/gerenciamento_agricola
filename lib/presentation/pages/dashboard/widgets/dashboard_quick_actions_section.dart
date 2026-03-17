import 'package:flutter/material.dart';
import 'package:gerenciamento_agricola/core/navigation/app_routes.dart';
import 'package:gerenciamento_agricola/core/theme/design_system/app_tokens.dart';
import 'dashboard_quick_action_card.dart';

class DashboardQuickActionsSection extends StatelessWidget {
  const DashboardQuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: AppSpacing.sm,
      crossAxisSpacing: AppSpacing.sm,
      children: [
        DashboardQuickActionCard(
          icon: Icons.add_shopping_cart_rounded,
          label: 'Nova Compra',
          onTap: () => Navigator.pushNamed(context, AppRoutes.purchaseForm),
        ),
        DashboardQuickActionCard(
          icon: Icons.grass_rounded,
          label: 'Nova Produção',
          onTap: () => Navigator.pushNamed(context, AppRoutes.productionForm),
        ),
        DashboardQuickActionCard(
          icon: Icons.move_to_inbox_rounded,
          label: 'Movimentação',
          onTap: () =>
              Navigator.pushNamed(context, AppRoutes.stockMovementForm),
        ),
        DashboardQuickActionCard(
          icon: Icons.inventory_2_rounded,
          label: 'Produtos',
          onTap: () => Navigator.pushNamed(context, AppRoutes.products),
        ),
        DashboardQuickActionCard(
          icon: Icons.store_rounded,
          label: 'Fornecedores',
          onTap: () => Navigator.pushNamed(context, AppRoutes.suppliers),
        ),
        DashboardQuickActionCard(
          icon: Icons.calculate_rounded,
          label: 'Simulador',
          onTap: () =>
              Navigator.pushNamed(context, AppRoutes.creditSimulation),
        ),
      ],
    );
  }
}
