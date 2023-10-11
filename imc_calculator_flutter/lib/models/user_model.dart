class Usermodel {
  String? name;
  String? altura;
  String? peso;

  Usermodel({this.name, this.altura, this.peso});

  Usermodel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    altura = json['altura'];
    peso = json['peso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['altura'] = altura;
    data['peso'] = peso;
    return data;
  }
}
