import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_agricola/core/injection/service_locator.dart';
import 'package:gerenciamento_agricola/core/theme/app_text_styles.dart';
import 'package:gerenciamento_agricola/core/theme/design_system/app_tokens.dart';
import 'package:gerenciamento_agricola/domain/entities/category_entity.dart';
import 'package:gerenciamento_agricola/presentation/cubits/category_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/category_state.dart'
    hide ErrorType;
import 'package:gerenciamento_agricola/presentation/widgets/error_display_widget.dart';

class CategoryManagementDialog extends StatelessWidget {
  const CategoryManagementDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => BlocProvider(
        create: (_) => sl<CategoryCubit>()..loadCategories(),
        child: const CategoryManagementDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480, maxHeight: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Header(),
            const Divider(height: 1),
            const Expanded(child: _CategoryList()),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.paddingMD,
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Gerenciar Categorias',
              style: AppTextStyles.titleMedium(context),
            ),
          ),
          FilledButton.icon(
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Nova'),
            onPressed: () => _openForm(context, category: null),
          ),
          AppSpacing.gapSM,
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _openForm(BuildContext context, {CategoryEntity? category}) {
    final cubit = context.read<CategoryCubit>();
    showDialog<bool>(
      context: context,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: _CategoryFormDialog(category: category),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is CategoryError) {
          context.showErrorSnackBar(
            message: state.message,
            details: state.details,
            type: ErrorType.generic,
          );
        }
      },
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CategoryError) {
          return ErrorDisplayWidget(
            message: state.message,
            details: state.details,
            type: state.type == ErrorType.validation
                ? ErrorType.validation
                : ErrorType.generic,
            onRetry: () => context.read<CategoryCubit>().loadCategories(),
          );
        }

        if (state is CategoriesLoaded) {
          if (state.categories.isEmpty) {
            return _EmptyState(onAdd: () => _openForm(context, category: null));
          }
          return ListView.separated(
            padding: AppSpacing.verticalSM,
            itemCount: state.categories.length,
            separatorBuilder: (_, _) => const Divider(height: 1, indent: 16),
            itemBuilder: (context, index) {
              final category = state.categories[index];
              return _CategoryTile(
                category: category,
                onEdit: () => _openForm(context, category: category),
                onDelete: () => _confirmDelete(context, category),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  void _openForm(BuildContext context, {CategoryEntity? category}) {
    final cubit = context.read<CategoryCubit>();
    showDialog<bool>(
      context: context,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: _CategoryFormDialog(category: category),
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    CategoryEntity category,
  ) async {
    final cubit = context.read<CategoryCubit>();

    final count = await cubit.countProductsByCategory(category.id!);
    if (!context.mounted) return;

    if (count > 0) {
      await showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Não é possível excluir'),
          content: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                const TextSpan(text: 'A categoria '),
                TextSpan(
                  text: '"${category.name}"',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ' possui $count produto${count > 1 ? 's' : ''} vinculado${count > 1 ? 's' : ''}.\n\n'
                      'Remova ou reatribua os produtos antes de excluir esta categoria.',
                ),
              ],
            ),
          ),
          actions: [
            FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Entendi'),
            ),
          ],
        ),
      );
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Excluir Categoria'),
        content: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              const TextSpan(text: 'Deseja excluir a categoria '),
              TextSpan(
                text: '"${category.name}"',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextSpan(text: '?'),
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
            child: Text(
              'Excluir',
              style: AppTextStyles.labelMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onError,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      await cubit.deleteCategory(category.id!);
    }
  }
}

class _CategoryTile extends StatelessWidget {
  final CategoryEntity category;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _CategoryTile({
    required this.category,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: colorScheme.primaryContainer,
        child: Text(
          category.name[0].toUpperCase(),
          style: TextStyle(
            color: colorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(category.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, size: 20),
            tooltip: 'Editar',
            onPressed: onEdit,
          ),
          IconButton(
            icon: Icon(
              Icons.delete_outline,
              size: 20,
              color: colorScheme.error,
            ),
            tooltip: 'Excluir',
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback onAdd;
  const _EmptyState({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: AppSpacing.paddingXL,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.label_off_outlined,
              size: 64,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
            ),
            AppSpacing.gapMD,
            Text(
              'Nenhuma categoria cadastrada',
              style: AppTextStyles.titleMedium(
                context,
              ).copyWith(color: colorScheme.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
            AppSpacing.gapSM,
            Text(
              'Crie categorias para organizar seus produtos.',
              style: AppTextStyles.bodySmall(context).copyWith(
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
            AppSpacing.gapLG,
            FilledButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Criar Categoria'),
              onPressed: onAdd,
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryFormDialog extends StatefulWidget {
  final CategoryEntity? category;
  const _CategoryFormDialog({this.category});

  @override
  State<_CategoryFormDialog> createState() => _CategoryFormDialogState();
}

class _CategoryFormDialogState extends State<_CategoryFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  bool _isSaving = false;

  bool get _isEditing => widget.category != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.category?.name ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _save(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);

    final cubit = context.read<CategoryCubit>();
    if (_isEditing) {
      await cubit.updateCategory(
        widget.category!.id!,
        _nameController.text.trim(),
      );
    } else {
      await cubit.createCategory(_nameController.text.trim());
    }

    if (!mounted) return;
    final state = cubit.state;
    if (state is CategoryError) {
      setState(() => _isSaving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } else {
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_isEditing ? 'Editar Categoria' : 'Nova Categoria'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _nameController,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Nome *',
            hintText: 'Ex: Fertilizantes, Sementes...',
          ),
          maxLength: 100,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => _save(context),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Nome é obrigatório';
            }
            if (value.trim().length < 2) {
              return 'Nome deve ter ao menos 2 caracteres';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSaving ? null : () => Navigator.of(context).pop(false),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: _isSaving ? null : () => _save(context),
          child: _isSaving
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(_isEditing ? 'Salvar' : 'Criar'),
        ),
      ],
    );
  }
}
