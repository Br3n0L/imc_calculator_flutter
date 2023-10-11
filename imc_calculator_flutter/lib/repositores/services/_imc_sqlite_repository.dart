import 'package:imc_calculator_flutter/sqlite/database_sqlite.dart';
import 'package:imc_calculator_flutter/sqlite/imc_sqlite_model.dart';
import 'package:intl/intl.dart';

class ImcSqliteRepository {
  Future<List<ImcSqliteModel>> iniciarBancoDeDados() async {
    List<ImcSqliteModel> ListadadosArmazenados = [];
    var db = await SQLiteDataBase().obterDataBase();
    var result = await db.rawQuery(
        'SELECT id, nome, peso, altura, dataCalculo FROM ListadadosArmazenados');
    for (var element in result) {
      ListadadosArmazenados.add(
        ImcSqliteModel(
          id: int.parse(element['id'].toString()),
          nome: element['nome'].toString(),
          peso: double.parse(element['peso'].toString()),
          altura: double.parse(element['altura'].toString()),
          dataCalculo: DateTime.parse(element['dataCalculo'].toString()),
        ),
      );
    }
    return ListadadosArmazenados;
  }

  Future<void> salvar(ImcSqliteModel imcSqliteModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert(
      'INSERT INTO ListadadosArmazenados( nome, peso, altura, dataCalculo) VALUES(?, ?, ?, ?)',
      [
        imcSqliteModel.nome,
        imcSqliteModel.peso,
        imcSqliteModel.altura,
        DateFormat('dd/MM/yyyy HH:mm').format(imcSqliteModel.dataCalculo),
      ],
    );
  }

  Future<void> atualizar(ImcSqliteModel imcSqliteModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert(
      'UPDATE ListadadosArmazenados SET  nome = ?, peso = ?, altura = ?, dataCalculo = ? WHERE id = ?',
      [
        imcSqliteModel.nome,
        imcSqliteModel.peso,
        imcSqliteModel.altura,
        DateFormat('dd/MM/yyyy HH:mm').format(imcSqliteModel.dataCalculo),
        imcSqliteModel.id,
      ],
    );
  }

  Future<void> remover(int id) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert(
      'DELETE ListadadosArmazenados WHERE id = ?',
      [
        id,
      ],
    );
  }
}
