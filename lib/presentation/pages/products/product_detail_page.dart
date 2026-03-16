import 'package:flutter/material.dart';
import 'package:gerenciamento_agricola/core/navigation/app_routes.dart';
import 'package:gerenciamento_agricola/core/theme/app_text_styles.dart';
import 'package:gerenciamento_agricola/core/theme/design_system/app_tokens.dart';
import 'package:gerenciamento_agricola/domain/entities/products_entity.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product =
        ModalRoute.of(context)!.settings.arguments as ProductsEntity;
    final isProduction = product.isProduction;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name, style: AppTextStyles.titleLarge(context)),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Editar',
            onPressed: () => Navigator.pushNamed(
              context,
              AppRoutes.productForm,
              arguments: product,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: AppSpacing.paddingMD,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: AppSpacing.paddingLG,
              child: Column(
                children: [
                  Text(
                    product.name,
                    style: AppTextStyles.headlineSmall(context),
                    textAlign: TextAlign.center,
                  ),
                  AppSpacing.gapSM,
                  _TypeBadge(isProduction: isProduction),
                ],
              ),
            ),
          ),

          AppSpacing.gapMD,

          _SectionTitle(title: 'Informações Gerais'),
          Card(
            child: Column(
              children: [
                _InfoRow(
                  icon: Icons.straighten_outlined,
                  label: 'Unidade de Medida',
                  value: product.unit,
                ),
                const Divider(height: 1, indent: 56),
                _InfoRow(
                  icon: Icons.calendar_today_outlined,
                  label: 'Cadastrado em',
                  value: _formatDate(product.createdAt),
                ),
                const Divider(height: 1, indent: 56),
                _InfoRow(
                  icon: Icons.update_outlined,
                  label: 'Atualizado em',
                  value: _formatDate(product.updatedAt),
                ),
                if (product.description.isNotEmpty) ...[
                  const Divider(height: 1, indent: 56),
                  _InfoRow(
                    icon: Icons.description_outlined,
                    label: 'Descrição',
                    value: product.description,
                    multiline: true,
                  ),
                ],
              ],
            ),
          ),

          AppSpacing.gapMD,

          _SectionTitle(title: 'Ações Rápidas'),
          _QuickActionsGrid(product: product),

          AppSpacing.gapLG,
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}

class _TypeBadge extends StatelessWidget {
  final bool isProduction;
  const _TypeBadge({required this.isProduction});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = isProduction ? colorScheme.tertiary : colorScheme.secondary;
    final label = isProduction ? 'Produção Própria' : 'Insumo';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: AppRadius.radiusSM,
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: AppTextStyles.labelMedium(
          context,
        ).copyWith(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        title,
        style: AppTextStyles.labelMedium(context).copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool multiline;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.multiline = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: colorScheme.onSurfaceVariant, size: 22),
        title: Text(
          label,
          style: AppTextStyles.labelSmall(
            context,
          ).copyWith(color: colorScheme.onSurfaceVariant),
        ),
        subtitle: Text(
          value,
          style: AppTextStyles.bodyMedium(context),
          maxLines: multiline ? null : 1,
          overflow: multiline ? null : TextOverflow.ellipsis,
        ),
        dense: true,
      ),
    );
  }
}

class _QuickActionsGrid extends StatelessWidget {
  final ProductsEntity product;
  const _QuickActionsGrid({required this.product});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final actions = [
      _QuickAction(
        icon: Icons.inventory_2_outlined,
        label: 'Ver Estoque',
        color: colorScheme.primary,
        onTap: () => Navigator.pushNamed(
          context,
          AppRoutes.stockList,
          arguments: {'productId': product.id},
        ),
      ),
      _QuickAction(
        icon: Icons.swap_horiz,
        label: 'Movimentações',
        color: colorScheme.secondary,
        onTap: () => Navigator.pushNamed(
          context,
          AppRoutes.stockMovements,
          arguments: {'productId': product.id},
        ),
      ),
      if (product.isProduction)
        _QuickAction(
          icon: Icons.agriculture,
          label: 'Produções',
          color: colorScheme.tertiary,
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutes.productionList,
            arguments: {'productId': product.id},
          ),
        ),
      _QuickAction(
        icon: Icons.shopping_cart_outlined,
        label: 'Compras',
        color: colorScheme.error,
        onTap: () => Navigator.pushNamed(
          context,
          AppRoutes.purchasesList,
          arguments: {'productId': product.id},
        ),
      ),
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: AppSpacing.sm,
      mainAxisSpacing: AppSpacing.sm,
      childAspectRatio: 2.4,
      children: actions.map((a) => _QuickActionCard(action: a)).toList(),
    );
  }
}

class _QuickAction {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });
}

class _QuickActionCard extends StatelessWidget {
  final _QuickAction action;
  const _QuickActionCard({required this.action});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: AppElevation.level1,
      child: InkWell(
        onTap: action.onTap,
        child: Padding(
          padding: AppSpacing.paddingSM,
          child: Row(
            children: [
              Container(
                padding: AppSpacing.paddingSM,
                decoration: BoxDecoration(
                  color: action.color.withValues(alpha: 0.12),
                  borderRadius: AppRadius.radiusSM,
                ),
                child: Icon(action.icon, color: action.color, size: 20),
              ),
              AppSpacing.gapSM,
              Expanded(
                child: Text(
                  action.label,
                  style: AppTextStyles.labelMedium(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
