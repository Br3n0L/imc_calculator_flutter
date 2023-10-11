import 'package:imc_calculator_flutter/sqlite/database_sqlite.dart';
import 'package:imc_calculator_flutter/sqlite/imc_sqlite_model.dart';

class ImcSqliteRepository {
  Future<List<ImcSqliteModel>> iniciarBancoDeDados() async {
    List<ImcSqliteModel> ListadadosArmazenados = [];
    var db = await SQLiteDataBase().obterDataBase();
    var result = await db.rawQuery(
        'SELECT id, nome, peso, altura, imcRetornoHistorico, dataCalculo FROM dadosArmazenados ');
    for (var element in result) {
      ListadadosArmazenados.add(
        ImcSqliteModel(
          int.parse(element['id'].toString()),
          element['nome'].toString(),
          double.parse(element['peso'].toString()),
          double.parse(element['altura'].toString()),
          element['imcRetornoHistorico'].toString(),
          double.parse(element['dataCalculo'].toString()),
        ),
      );
    }
    return ListadadosArmazenados;
  }

  Future<void> salvar(ImcSqliteModel imcSqliteModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert(
      'INSERT INTO ListadadosArmazenados(id, nome, peso, altura, imcRetornoHistorico, dataCalculo) VALUES(?, ?, ?, ?, ?, ?)',
      [
        imcSqliteModel.getId,
        imcSqliteModel.getNome,
        imcSqliteModel.getpeso,
        imcSqliteModel.getAltura,
        imcSqliteModel.getImcRetornoHistorico,
        imcSqliteModel.getDataCalculo,
      ],
    );
  }

  Future<void> atualizar(ImcSqliteModel imcSqliteModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert(
      'UPDATE ListadadosArmazenados SET  nome = ?, peso = ?, altura = ?, imcRetornoHistorico = ?, dataCalculo = ? WHERE id = ?',
      [
        imcSqliteModel.getNome,
        imcSqliteModel.getpeso,
        imcSqliteModel.getAltura,
        imcSqliteModel.getImcRetornoHistorico,
        imcSqliteModel.getDataCalculo,
        imcSqliteModel.getId,
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
