import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_agricola/core/navigation/app_routes.dart';
import 'package:gerenciamento_agricola/core/theme/app_text_styles.dart';
import 'package:gerenciamento_agricola/core/theme/design_system/app_tokens.dart';
import 'package:gerenciamento_agricola/domain/entities/products_entity.dart';
import 'package:gerenciamento_agricola/presentation/cubits/products_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/products_state.dart';
import 'package:gerenciamento_agricola/presentation/widgets/error_display_widget.dart';

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({super.key});

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  final _searchController = TextEditingController();

  String _searchQuery = '';
  _ProductTypeFilter _typeFilter = _ProductTypeFilter.all;

  int? _categoryFilter;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsCubit>().loadProducts();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ProductsEntity> _applyFilters(List<ProductsEntity> all) {
    return all.where((p) {
      final matchesSearch =
          _searchQuery.isEmpty ||
          p.name.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesType = switch (_typeFilter) {
        _ProductTypeFilter.all => true,
        _ProductTypeFilter.production => p.isProduction,
        _ProductTypeFilter.input => !p.isProduction,
      };
      final matchesCategory =
          _categoryFilter == null || p.categoryId == _categoryFilter;
      return matchesSearch && matchesType && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos', style: AppTextStyles.titleLarge(context)),
        actions: [
          IconButton(
            icon: const Icon(Icons.label_outline),
            tooltip: 'Gerenciar Categorias',
            onPressed: () => Navigator.pushNamed(context, AppRoutes.categories),
          ),
        ],
      ),
      body: Column(
        children: [
          _SearchAndFiltersBar(
            searchController: _searchController,
            typeFilter: _typeFilter,
            onSearchChanged: (q) => setState(() => _searchQuery = q),
            onTypeFilterChanged: (f) => setState(() => _typeFilter = f),
          ),
          Expanded(
            child: BlocConsumer<ProductsCubit, ProductsState>(
              listener: (context, state) {
                if (state is ProductOperationError) {
                  context.showErrorSnackBar(
                    message: state.message,
                    details: state.details,
                    type: state.type,
                  );
                }
              },
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is ProductOperationError) {
                  return ErrorDisplayWidget(
                    message: state.message,
                    details: state.details,
                    type: state.type,
                    onRetry: () => context.read<ProductsCubit>().loadProducts(),
                  );
                }

                if (state is ProductsLoaded) {
                  final filtered = _applyFilters(state.products);

                  if (state.products.isEmpty) {
                    return _EmptyProductsState(onAdd: () => _openForm(context));
                  }

                  if (filtered.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 56,
                            color: colorScheme.onSurfaceVariant.withValues(
                              alpha: 0.4,
                            ),
                          ),
                          AppSpacing.gapMD,
                          Text(
                            'Nenhum produto encontrado',
                            style: AppTextStyles.titleSmall(
                              context,
                            ).copyWith(color: colorScheme.onSurfaceVariant),
                          ),
                        ],
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () =>
                        context.read<ProductsCubit>().loadProducts(),
                    child: ListView.separated(
                      padding: AppSpacing.paddingMD,
                      itemCount: filtered.length,
                      separatorBuilder: (_, _) => AppSpacing.gapSM,
                      itemBuilder: (context, index) => _ProductCard(
                        product: filtered[index],
                        onTap: () => _openDetail(context, filtered[index]),
                        onEdit: () =>
                            _openForm(context, product: filtered[index]),
                        onDelete: () =>
                            _confirmDelete(context, filtered[index]),
                      ),
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FilledButton.icon(
        onPressed: () => _openForm(context),
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
        icon: const Icon(Icons.add),
        label: const Text('Novo Produto'),
      ),
    );
  }

  void _openForm(BuildContext context, {ProductsEntity? product}) {
    Navigator.pushNamed(context, AppRoutes.productForm, arguments: product);
  }

  void _openDetail(BuildContext context, ProductsEntity product) {
    Navigator.pushNamed(context, AppRoutes.productDetail, arguments: product);
  }

  Future<void> _confirmDelete(
    BuildContext context,
    ProductsEntity product,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Excluir Produto'),
        content: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              const TextSpan(text: 'Deseja excluir '),
              TextSpan(
                text: '"${product.name}"',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextSpan(text: '? Esta ação não pode ser desfeita.'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );

    if (confirmed == true && product.id != null && mounted) {
      await context.read<ProductsCubit>().deleteProduct(product.id!);
    }
  }
}

enum _ProductTypeFilter { all, production, input }

class _SearchAndFiltersBar extends StatelessWidget {
  final TextEditingController searchController;
  final _ProductTypeFilter typeFilter;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<_ProductTypeFilter> onTypeFilterChanged;

  const _SearchAndFiltersBar({
    required this.searchController,
    required this.typeFilter,
    required this.onSearchChanged,
    required this.onTypeFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        AppSpacing.xs,
      ),
      decoration: BoxDecoration(color: colorScheme.surface),

      child: Column(
        children: [
          TextField(
            controller: searchController,
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              hintText: 'Buscar produtos...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        searchController.clear();
                        onSearchChanged('');
                      },
                    )
                  : null,
              isDense: true,
              filled: true,
              fillColor: colorScheme.surfaceContainerHighest,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                borderSide: BorderSide(color: colorScheme.primary, width: 2),
              ),
            ),
          ),
          AppSpacing.gapSM,

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _FilterChip(
                  label: 'Todos',
                  selected: typeFilter == _ProductTypeFilter.all,
                  onSelected: (_) =>
                      onTypeFilterChanged(_ProductTypeFilter.all),
                ),
                AppSpacing.gapSM,
                _FilterChip(
                  label: 'Produção',
                  icon: Icons.agriculture,
                  selected: typeFilter == _ProductTypeFilter.production,
                  onSelected: (_) =>
                      onTypeFilterChanged(_ProductTypeFilter.production),
                ),
                AppSpacing.gapSM,
                _FilterChip(
                  label: 'Insumo',
                  icon: Icons.inventory_2_outlined,
                  selected: typeFilter == _ProductTypeFilter.input,
                  onSelected: (_) =>
                      onTypeFilterChanged(_ProductTypeFilter.input),
                ),
              ],
            ),
          ),
          AppSpacing.gapSM,
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool selected;
  final ValueChanged<bool> onSelected;

  const _FilterChip({
    required this.label,
    this.icon,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      avatar: icon != null ? Icon(icon, size: 16) : null,
      selected: selected,
      onSelected: onSelected,
      showCheckmark: false,
      side: BorderSide(
        color: selected
            ? Theme.of(context).colorScheme.primary
            : Colors.transparent,
      ),
      labelStyle: AppTextStyles.labelSmall(
        context,
      ).copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
      selectedColor: Theme.of(
        context,
      ).colorScheme.primary.withValues(alpha: 0.15),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductsEntity product;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _ProductCard({
    required this.product,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isProduction = product.isProduction;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: AppSpacing.paddingMD,
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isProduction
                      ? colorScheme.tertiaryContainer
                      : colorScheme.secondaryContainer,
                  borderRadius: AppRadius.radiusMD,
                ),
                child: Icon(
                  isProduction ? Icons.agriculture : Icons.inventory_2_outlined,
                  color: isProduction
                      ? colorScheme.onTertiaryContainer
                      : colorScheme.onSecondaryContainer,
                ),
              ),
              AppSpacing.gapMD,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: AppTextStyles.titleSmall(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppSpacing.gapXS,
                    Row(
                      children: [
                        _InfoBadge(
                          label: isProduction ? 'Produção' : 'Insumo',
                          color: isProduction
                              ? colorScheme.tertiary
                              : colorScheme.secondary,
                        ),
                        AppSpacing.gapSM,
                        Flexible(
                          child: Text(
                            product.unit,
                            style: AppTextStyles.labelSmall(
                              context,
                            ).copyWith(color: colorScheme.onSurfaceVariant),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    if (product.description.isNotEmpty) ...[
                      AppSpacing.gapXS,
                      Text(
                        product.description,
                        style: AppTextStyles.bodySmall(context).copyWith(
                          color: colorScheme.onSurfaceVariant.withValues(
                            alpha: 0.7,
                          ),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),

              PopupMenuButton<String>(
                itemBuilder: (_) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: ListTile(
                      leading: Icon(Icons.edit_outlined),
                      title: Text('Editar'),
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'detail',
                    child: ListTile(
                      leading: Icon(Icons.info_outline),
                      title: Text('Detalhes'),
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: ListTile(
                      leading: Icon(
                        Icons.delete_outline,
                        color: colorScheme.error,
                      ),
                      title: Text(
                        'Excluir',
                        style: TextStyle(color: colorScheme.error),
                      ),
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                    ),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'edit') onEdit();
                  if (value == 'detail') onTap();
                  if (value == 'delete') onDelete();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _InfoBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: AppRadius.radiusSM,
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: AppTextStyles.labelSmall(
          context,
        ).copyWith(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _EmptyProductsState extends StatelessWidget {
  final VoidCallback onAdd;
  const _EmptyProductsState({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.xl),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.paddingMD.horizontal,
            vertical: AppSpacing.paddingLG.vertical,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.inventory_2_outlined,
                size: 80,
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
              ),
              AppSpacing.gapMD,
              Text(
                'Nenhum produto cadastrado',
                style: AppTextStyles.titleMedium(
                  context,
                ).copyWith(color: colorScheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              AppSpacing.gapSM,
              Text(
                'Comece cadastrando seus produtos agrícolas.',
                style: AppTextStyles.bodyMedium(context).copyWith(
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
