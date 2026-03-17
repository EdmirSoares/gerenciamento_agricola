import 'package:flutter/material.dart';
import 'package:gerenciamento_agricola/core/theme/design_system/app_tokens.dart';
import 'package:gerenciamento_agricola/core/theme/theme_extensions.dart';
import 'dashboard_summary_card.dart';

class DashboardSummarySection extends StatelessWidget {
  const DashboardSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = AppThemeExtension.of(context);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DashboardSummaryCard(
                icon: Icons.inventory_2,
                title: 'Produtos',
                value: '0',
                subtitle: 'cadastrados',
                color: colorScheme.primary,
              ),
            ),
            AppSpacing.gapSM,
            Expanded(
              child: DashboardSummaryCard(
                icon: Icons.warning_amber,
                title: 'Estoque Baixo',
                value: '0',
                subtitle: 'itens',
                color: customColors.stockLow,
              ),
            ),
          ],
        ),
        AppSpacing.gapSM,
        Row(
          children: [
            Expanded(
              child: DashboardSummaryCard(
                icon: Icons.shopping_cart,
                title: 'Compras',
                value: '0',
                subtitle: 'este mês',
                color: colorScheme.tertiary,
              ),
            ),
            AppSpacing.gapSM,
            Expanded(
              child: DashboardSummaryCard(
                icon: Icons.agriculture,
                title: 'Produções',
                value: '0',
                subtitle: 'este mês',
                color: colorScheme.secondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
