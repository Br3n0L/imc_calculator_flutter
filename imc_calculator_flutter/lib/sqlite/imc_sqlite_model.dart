class ImcSqliteModel {
  final int id;
  final String nome;
  final double peso;
  final double altura;

  final DateTime dataCalculo;

  ImcSqliteModel({
    required this.id,
    required this.nome,
    required this.peso,
    required this.altura,
    required this.dataCalculo,
  });
}
