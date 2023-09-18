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
                  height: 12,
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
                  margin: const EdgeInsets.fromLTRB(50, 20, 20, 50),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
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
