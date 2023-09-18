import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController alturaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();

  TextEditingController pesoController = TextEditingController();
  String? resultado;
  String? imc;

  void resetFields() {
    alturaController.text = '';
    pesoController.text = '';
    imc = null;
    resultado = null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora de IMC'),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xffFFFFFF),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  '',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              color: const Color(0xff879BA2),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.male,
                                color: Color(0xffC8D8DF),
                                size: 45,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Homem',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffC8D8DF),
                                ),
                              )
                            ],
                          )),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              color: const Color(0xffECAB9A),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.female,
                                size: 45,
                                color: Color(0xffC8D8DF),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Mulher',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffC8D8DF),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nomeController,
                    decoration: const InputDecoration(
                      hintText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    controller: alturaController,
                    decoration: const InputDecoration(
                      suffixText: 'Ex. 177',
                      hintText: 'Altura em Cm',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    controller: pesoController,
                    decoration: const InputDecoration(
                      hintText: 'Peso KG',
                      suffixText: 'Ex. 90',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  child: Text('$resultado'),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 8, 20),
                  child: Row(
                    children: [
                      Container(
                        width: 200,
                        height: 75,
                        decoration: BoxDecoration(
                            color: const Color(0xff879BA2),
                            borderRadius: BorderRadius.circular(100)),
                        margin: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  resetFields();
                                });
                              },
                              child: const Row(
                                children: [Icon(Icons.refresh), Text('Apagar')],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 130,
                        height: 75,
                        decoration: BoxDecoration(
                            color: const Color(0xffECAB9A),
                            borderRadius: BorderRadius.circular(100)),
                        margin: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                double? peso =
                                    double.tryParse(pesoController.text);
                                double? altura =
                                    double.tryParse(alturaController.text);

                                if (peso != null && altura != null) {
                                  altura = altura / 100.0;
                                  double _imc = (peso / (altura * altura))
                                      .roundToDouble();

                                  resultado =
                                      'Digite seus dados para obter o cálculo';

                                  setState(() {
                                    imc = _imc.toString();
                                    if (nomeController == '' &&
                                        alturaController == '' &&
                                        pesoController == '') {
                                      resultado = ' Digite seus dados. ';
                                    } else {
                                      resultado =
                                          'O resultado do IMC de ${nomeController.text} é $imc';
                                    }
                                  });
                                }
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.forward),
                                  Text('Calcular')
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
