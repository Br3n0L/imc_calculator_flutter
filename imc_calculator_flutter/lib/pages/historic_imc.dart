import 'package:flutter/material.dart';
import 'package:imc_calculator_flutter/repositores/services/_imc_sqlite_repository.dart';

import 'package:imc_calculator_flutter/sqlite/imc_sqlite_model.dart';

class HistoricIMCScreen extends StatefulWidget {
  @override
  _HistoricIMCScreenState createState() => _HistoricIMCScreenState();
}

class _HistoricIMCScreenState extends State<HistoricIMCScreen> {
  final ImcSqliteRepository repository = ImcSqliteRepository();
  List<ImcSqliteModel> historicData = [];

  @override
  void initState() {
    super.initState();
    carregarHistoricoIMC();
  }

  void carregarHistoricoIMC() async {
    List<ImcSqliteModel> data = await repository.iniciarBancoDeDados();
    setState(() {
      historicData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de IMC'),
      ),
      body: ListView.builder(
        itemCount: historicData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Nome: ${historicData[index].getNome}'),
            subtitle: Text(
                'IMC: ${historicData[index].getImcRetornoHistorico.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}