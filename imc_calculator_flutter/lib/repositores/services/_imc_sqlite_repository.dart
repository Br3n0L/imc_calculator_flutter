import 'package:sqflite/sqflite.dart';
import 'package:imc_calculator_flutter/sqlite/imc_sqlite_model.dart';
import 'package:intl/intl.dart';

class SQLiteDataBase {
  static Database? _database;

  Future<Database> obterDataBase() async {
    if (_database != null) {
      return _database!;
    }

    _database = await openDatabase(
      'ListadadosArmazenados.db',
      version: 1,
      onCreate: (db, version) {
        // Crie a tabela "ListadadosArmazenados" se ela não existir
        db.execute('''
          CREATE TABLE IF NOT EXISTS ListadadosArmazenados (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            peso REAL,
            altura REAL,
            dataCalculo TEXT
          )
        ''');
      },
    );

    return _database!;
  }
}

class ImcSqliteRepository {
  Future<List<ImcSqliteModel>> iniciarBancoDeDados() async {
    List<ImcSqliteModel> ListadadosArmazenados = [];
    var db = await SQLiteDataBase().obterDataBase();
    var result = await db.rawQuery(
        'SELECT id, nome, peso, altura, dataCalculo FROM ListadadosArmazenados');
    for (var element in result) {
      final formatoData =
          DateFormat('dd/MM/yyyy HH:mm'); // Formato igual ao usado para salvar
      ListadadosArmazenados.add(
        ImcSqliteModel(
          id: int.parse(element['id'].toString()),
          nome: element['nome'].toString(),
          peso: double.parse(element['peso'].toString()),
          altura: double.parse(element['altura'].toString()),
          dataCalculo: formatoData.parse(element['dataCalculo'].toString()),
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
      'DELETE FROM ListadadosArmazenados WHERE id = ?',
      [
        id,
      ],
    );
  }
}
