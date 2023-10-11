import 'package:flutter/material.dart';
import 'package:imc_calculator_flutter/repositores/services/_imc_sqlite_repository.dart';

import 'package:imc_calculator_flutter/sqlite/imc_sqlite_model.dart';

class HistoricIMCScreen extends StatefulWidget {
  const HistoricIMCScreen({Key? key}) : super(key: key);

  @override
  _HistoricIMCScreenState createState() => _HistoricIMCScreenState();
}

class _HistoricIMCScreenState extends State<HistoricIMCScreen> {
  final ImcSqliteRepository repository = ImcSqliteRepository();
  List<ImcSqliteModel> retornoData = [];

  @override
  void initState() {
    super.initState();
    _carregarHistoricoIMC();
  }

  Future<void> _carregarHistoricoIMC() async {
    List<ImcSqliteModel> data = await repository.iniciarBancoDeDados();
    setState(() {
      retornoData = data;
      print('Dados carregados: $retornoData');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico IMC'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Nome')),
              DataColumn(label: Text('Altura')),
              DataColumn(label: Text('Peso')),
              DataColumn(label: Text('Data')),
            ],
            rows: retornoData.map((data) {
              return DataRow(
                cells: [
                  DataCell(Text(data.id.toString())),
                  DataCell(Text(data.nome)),
                  DataCell(Text(data.altura.toString())),
                  DataCell(Text(data.peso.toString())),
                  DataCell(Text(data.dataCalculo.toLocal().toString())),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
