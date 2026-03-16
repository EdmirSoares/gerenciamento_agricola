import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_agricola/core/theme/app_text_styles.dart';
import 'package:gerenciamento_agricola/core/theme/design_system/app_tokens.dart';
import 'package:gerenciamento_agricola/domain/entities/products_entity.dart';
import 'package:gerenciamento_agricola/presentation/cubits/products_cubit.dart';
import 'package:gerenciamento_agricola/presentation/cubits/products_state.dart';
import 'package:gerenciamento_agricola/presentation/widgets/category_selector_widget.dart';
import 'package:gerenciamento_agricola/presentation/widgets/error_display_widget.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _unitController = TextEditingController();

  int? _selectedCategoryId;
  bool _isProduction = false;
  bool _isSaving = false;
  String? _categoryError;
  bool _categoryTouched = false;
  bool _formSubmitted = false;

  ProductsEntity? _editingProduct;
  bool get _isEditing => _editingProduct != null;

  static const _unitSuggestions = [
    'kg',
    'g',
    'ton',
    'L',
    'mL',
    'unidade',
    'caixa',
    'saca',
    'fardo',
    'ha',
    'm²',
    'dúzia',
    'pacote',
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_editingProduct == null) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is ProductsEntity) {
        _editingProduct = args;
        _nameController.text = args.name;
        _descriptionController.text = args.description;
        _unitController.text = args.unit;
        _selectedCategoryId = args.categoryId;
        _isProduction = args.isProduction;
        _categoryTouched = true;
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _unitController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    setState(() {
      _formSubmitted = true;
      _categoryTouched = true;
      _categoryError = _selectedCategoryId == null
          ? 'Selecione uma categoria'
          : null;
    });

    if (!_formKey.currentState!.validate()) return;
    if (_categoryError != null) return;

    setState(() => _isSaving = true);

    final cubit = context.read<ProductsCubit>();

    if (_isEditing) {
      await cubit.updateProduct(
        _editingProduct!.id!,
        _nameController.text.trim(),
        _selectedCategoryId!,
        _unitController.text.trim(),
        _descriptionController.text.trim(),
        _isProduction,
      );
    } else {
      await cubit.createProduct(
        _nameController.text.trim(),
        _selectedCategoryId!,
        _unitController.text.trim(),
        _descriptionController.text.trim(),
        _isProduction,
      );
    }

    if (!mounted) return;

    final state = cubit.state;
    if (state is ProductOperationError) {
      setState(() => _isSaving = false);
      context.showErrorSnackBar(
        message: state.message,
        details: state.details,
        type: state.type,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _isEditing ? 'Produto atualizado!' : 'Produto criado com sucesso!',
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
      Navigator.of(context).pop(true);
    }
  }

  Future<void> _confirmDelete() async {
    if (_editingProduct?.id == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Excluir Produto'),
        content: Text(
          'Deseja excluir "${_editingProduct!.name}"? Esta ação não pode ser desfeita.',
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

    if (confirmed == true && mounted) {
      await context.read<ProductsCubit>().deleteProduct(_editingProduct!.id!);
      if (mounted) Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditing ? 'Editar Produto' : 'Novo Produto',
          style: AppTextStyles.titleLarge(context),
        ),
        actions: [
          if (_isEditing)
            IconButton(
              icon: Icon(Icons.delete_outline, color: colorScheme.error),
              tooltip: 'Excluir produto',
              onPressed: _isSaving ? null : _confirmDelete,
            ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _isSaving ? null : () => Navigator.pop(context),
                  child: const Text('Cancelar'),
                ),
              ),
              AppSpacing.gapMD,
              Expanded(
                flex: 2,
                child: FilledButton.icon(
                  onPressed: _isSaving ? null : _save,
                  icon: _isSaving
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : null,
                  label: Text(
                    _isEditing ? 'Salvar Alterações' : 'Criar Produto',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocListener<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is ProductOperationError && _isSaving) {
            setState(() => _isSaving = false);
          }
        },
        child: SingleChildScrollView(
          padding: AppSpacing.paddingMD,
          child: Form(
            key: _formKey,
            autovalidateMode: _formSubmitted
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome *',
                    hintText: 'Ex: Soja, Herbicida ...',
                    prefixIcon: Icon(Icons.label_outline),
                  ),
                  maxLength: 100,
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Nome é obrigatório';
                    }
                    if (v.trim().length < 3) {
                      return 'Nome deve ter ao menos 3 caracteres';
                    }
                    return null;
                  },
                ),
                AppSpacing.gapMD,

                CategorySelectorWidget(
                  selectedCategoryId: _selectedCategoryId,
                  onChanged: (id) {
                    setState(() {
                      _selectedCategoryId = id;
                      _categoryTouched = true;
                      _categoryError = id == null
                          ? 'Selecione uma categoria'
                          : null;
                    });
                  },
                  errorText: _categoryTouched ? _categoryError : null,
                ),
                AppSpacing.gapMD,

                Autocomplete<String>(
                  optionsBuilder: (textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return _unitSuggestions;
                    }
                    return _unitSuggestions.where(
                      (u) => u.toLowerCase().contains(
                        textEditingValue.text.toLowerCase(),
                      ),
                    );
                  },
                  onSelected: (selection) {
                    _unitController.text = selection;
                  },
                  fieldViewBuilder:
                      (context, controller, focusNode, onEditingComplete) {
                        if (controller.text != _unitController.text) {
                          controller.text = _unitController.text;
                        }
                        controller.addListener(
                          () => _unitController.text = controller.text,
                        );
                        return TextFormField(
                          controller: controller,
                          focusNode: focusNode,
                          onEditingComplete: onEditingComplete,
                          decoration: const InputDecoration(
                            labelText: 'Unidade de medida *',
                            hintText: 'Ex: kg, litros, saca...',
                            prefixIcon: Icon(Icons.straighten_outlined),
                          ),
                          textInputAction: TextInputAction.next,
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) {
                              return 'Unidade de medida é obrigatória';
                            }
                            return null;
                          },
                        );
                      },
                ),
                AppSpacing.gapMD,

                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Descrição',
                    hintText: 'Informações adicionais (opcional)',
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(bottom: 52),
                      child: Icon(Icons.description_outlined),
                    ),
                    alignLabelWithHint: true,
                  ),
                  maxLines: 3,
                  maxLength: 500,
                  textInputAction: TextInputAction.newline,
                ),
                AppSpacing.gapSM,

                Card(
                  elevation: AppElevation.level0,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppRadius.radiusMD,
                    side: BorderSide(color: colorScheme.outlineVariant),
                  ),
                  child: SwitchListTile(
                    title: const Text('Colhido/produzido na fazenda'),
                    secondary: Icon(
                      _isProduction
                          ? Icons.agriculture
                          : Icons.inventory_2_outlined,
                      color: _isProduction
                          ? colorScheme.tertiary
                          : colorScheme.secondary,
                    ),
                    value: _isProduction,
                    onChanged: (v) => setState(() => _isProduction = v),
                  ),
                ),
                AppSpacing.gapXL,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
