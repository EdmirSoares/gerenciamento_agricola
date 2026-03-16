import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_agricola/core/injection/service_locator.dart';
import 'package:gerenciamento_agricola/core/theme/design_system/app_tokens.dart';
import 'package:gerenciamento_agricola/domain/entities/category_entity.dart';
import 'package:gerenciamento_agricola/presentation/cubits/category_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/category_state.dart';

class CategorySelectorWidget extends StatelessWidget {
  final int? selectedCategoryId;
  final ValueChanged<int?> onChanged;
  final String? errorText;
  final bool enabled;

  const CategorySelectorWidget({
    super.key,
    required this.selectedCategoryId,
    required this.onChanged,
    this.errorText,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CategoryCubit>()..loadCategories(),
      child: _CategorySelectorContent(
        selectedCategoryId: selectedCategoryId,
        onChanged: onChanged,
        errorText: errorText,
        enabled: enabled,
      ),
    );
  }
}

class _CategorySelectorContent extends StatelessWidget {
  final int? selectedCategoryId;
  final ValueChanged<int?> onChanged;
  final String? errorText;
  final bool enabled;

  const _CategorySelectorContent({
    required this.selectedCategoryId,
    required this.onChanged,
    this.errorText,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        final categories = state is CategoriesLoaded
            ? state.categories
            : <CategoryEntity>[];
        final isLoading = state is CategoryLoading;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: DropdownButtonFormField<int>(
                initialValue: _validateSelectedId(
                  selectedCategoryId,
                  categories,
                ),
                decoration: InputDecoration(
                  labelText: 'Categoria *',
                  hintText: isLoading
                      ? 'Carregando...'
                      : 'Selecione a categoria',
                  errorText: errorText,
                  suffixIcon: isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(12),
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : null,
                ),
                items: categories
                    .map(
                      (c) => DropdownMenuItem<int>(
                        value: c.id,
                        child: Text(c.name),
                      ),
                    )
                    .toList(),
                onChanged: enabled && !isLoading ? onChanged : null,
              ),
            ),
            AppSpacing.gapSM,
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Tooltip(
                message: 'Nova categoria',
                child: IconButton.filled(
                  icon: const Icon(Icons.add),
                  onPressed: enabled
                      ? () => _openCreateCategoryDialog(context)
                      : null,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  int? _validateSelectedId(int? id, List<CategoryEntity> categories) {
    if (id == null) return null;
    return categories.any((c) => c.id == id) ? id : null;
  }

  Future<void> _openCreateCategoryDialog(BuildContext context) async {
    final cubit = context.read<CategoryCubit>();
    final created = await showDialog<bool>(
      context: context,
      builder: (_) =>
          BlocProvider.value(value: cubit, child: const _CategoryFormDialog()),
    );

    if (created == true) {
      final state = cubit.state;
      if (state is CategoriesLoaded && state.categories.isNotEmpty) {
        final newest = state.categories.last;
        onChanged(newest.id);
      }
    }
  }
}

class _CategoryFormDialog extends StatefulWidget {
  const _CategoryFormDialog();

  @override
  State<_CategoryFormDialog> createState() => _CategoryFormDialogState();
}

class _CategoryFormDialogState extends State<_CategoryFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _save(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);

    final cubit = context.read<CategoryCubit>();
    await cubit.createCategory(_nameController.text.trim());

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
      title: const Text('Nova Categoria'),
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
              : const Text('Salvar'),
        ),
      ],
    );
  }
}
