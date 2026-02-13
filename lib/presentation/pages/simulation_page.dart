import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../cubits/simulation_cubit.dart';
import '../cubits/simulation_state.dart';

class SimulationPage extends StatefulWidget {
  const SimulationPage({super.key});

  @override
  State<SimulationPage> createState() => _SimulationPageState();
}

class _SimulationPageState extends State<SimulationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _rateController = TextEditingController();
  final _monthsController = TextEditingController();

  final _currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  void initState() {
    super.initState();
    context.read<SimulationCubit>().loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crédito Agrícola'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: BlocConsumer<SimulationCubit, SimulationState>(
        listener: (context, state) {
          if (state is SimulationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Simulação salva com sucesso!')),
            );
            context.read<SimulationCubit>().loadHistory(); // Atualiza a lista
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildForm(),
                const SizedBox(height: 32),
                const Text(
                  'Rascunhos Salvos (Offline)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Divider(),
                _buildHistoryList(state),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome do Produtor'),
                validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
              ),
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Valor Solicitado (Ex: 50000)'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _rateController,
                      decoration: const InputDecoration(labelText: 'Taxa Anual (%)'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _monthsController,
                      decoration: const InputDecoration(labelText: 'Prazo (Meses)'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<SimulationCubit>().calculate(
                      name: _nameController.text,
                      amountStr: _amountController.text,
                      rateStr: _rateController.text,
                      months: int.parse(_monthsController.text),
                    );
                  }
                },
                child: const Text('CALCULAR E SALVAR OFFLINE'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryList(SimulationState state) {
    if (state is SimulationLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return BlocBuilder<SimulationCubit, SimulationState>(
      builder: (context, state) {
        if (state is SimulationHistoryLoaded) {
          if (state.history.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Nenhum rascunho encontrado.'),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.history.length,
            itemBuilder: (context, index) {
              final item = state.history[index];
              return ListTile(
                leading: const Icon(Icons.agriculture, color: Colors.green),
                title: Text(item.producerName),
                subtitle: Text('Total: ${_currencyFormat.format(double.parse(item.totalAmount.toString()))}'),
                trailing: const Icon(Icons.offline_pin, color: Colors.grey),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}