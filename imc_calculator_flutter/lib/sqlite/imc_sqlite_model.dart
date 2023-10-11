import 'package:intl/intl.dart';

class ImcSqliteModel {
  int id = 0;
  String nome = '';
  double peso = 0;
  double altura = 0;
  double imcRetornoHistorico = 0;
  String dataCalculo = "";

  ImcSqliteModel(this.id, this.nome, this.peso, this.altura, this.dataCalculo,
      this.imcRetornoHistorico);

  int get getId => id;

  String get getNome => nome;

  double get getpeso => peso;

  double get getAltura => altura;

  double get getImcRetornoHistorico => imcRetornoHistorico;

  String get getDataCalculo => dataCalculo;

  set setId(int id) {
    this.id = id;
  }

  set setNome(String nome) {
    this.nome = nome;
  }

  set setPeso(double peso) {
    this.peso = peso;
  }

  set setAltura(double altura) {
    this.altura = altura;
  }

  set setImcRetornoHistorico(double imcRetornoHistorico) {
    this.imcRetornoHistorico = imcRetornoHistorico;
  }

  void setDataCalculoIMC() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(now);
    dataCalculo = formattedDate;
  }

  String getDataCalculoIMC() {
    return dataCalculo;
  }
}
