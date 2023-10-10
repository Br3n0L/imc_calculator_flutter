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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['altura'] = this.altura;
    data['peso'] = this.peso;
    return data;
  }
}
