import 'package:flutter/material.dart';
import 'package:imc_calculator_flutter/pages/historic_imc.dart';

import 'package:imc_calculator_flutter/repositores/services/_imc_sqlite_repository.dart';

import 'package:imc_calculator_flutter/repositores/services/app_storage_services.dart';
import 'package:imc_calculator_flutter/sqlite/imc_sqlite_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImcSqliteRepository repository = ImcSqliteRepository();
  List<ImcSqliteModel> historicData = [];
  TextEditingController nomeController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  TextEditingController pesoController = TextEditingController();
  String? _infoText = 'Informe seus dados';
  String? imc;

  AppStorageService storage = AppStorageService();
  final String CHAVE_DADOS_CADASTRAIS_NOME = ' CHAVE_DADOS_CADASTRAIS_NOME';
  final String CHAVE_DADOS_CADASTRAIS_ALTURA = 'CHAVE_DADOS_CADASTRAIS_ALTURA';
  final String CHAVE_DADOS_CADASTRAIS_PESO = ' CHAVE_DADOS_CADASTRAIS_PESO';

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nomeController.text = await AppStorageService().getDadosCadastraisNome();
    alturaController.text =
        (await AppStorageService().getDadosCadastraisaltura()).toString();
  }

  void _resetFields() {
    nomeController.text = '';
    alturaController.text = '';

    pesoController.text = '';
    setState(() {
      _infoText = 'Informe seus dados acima para obter seu calculo de IMC';
    });
    imc = null;
  }

  _calculate() {
    setState(() {
      String nomeDigitado = nomeController.text;
      double altura = double.parse(alturaController.text) / 100;
      double peso = double.parse(pesoController.text);

      double ImcRetorno = peso / (altura * altura);
      if (ImcRetorno < 18.6) {
        _infoText =
            'O  usuário: $nomeDigitado, está Abaixo do peso, seu IMC é ${ImcRetorno.toStringAsFixed(2)}';
      } else if (ImcRetorno >= 18.6 && ImcRetorno < 24.9) {
        _infoText =
            'O  usuário: $nomeDigitado, está com Peso Ideal, seu IMC é ${ImcRetorno.toStringAsFixed(2)}';
      } else if (ImcRetorno >= 24.9 && ImcRetorno < 29.9) {
        _infoText =
            'O  usuário: $nomeDigitado, está Levemente Acima do Peso, seu IMC é  ${ImcRetorno.toStringAsFixed(2)}';
      } else if (ImcRetorno >= 29.9 && ImcRetorno < 34.9) {
        _infoText =
            'O  usuário: $nomeDigitado, está com Obesidade Grau I, seu IMC é  ${ImcRetorno.toStringAsFixed(2)}';
      } else if (ImcRetorno >= 34.9 && ImcRetorno < 39.9) {
        _infoText =
            'O  usuário: $nomeDigitado, com Obesidade Grau II, seu IMC é  ${ImcRetorno.toStringAsFixed(2)}';
      } else if (ImcRetorno > 40) {
        _infoText =
            'O  usuário: $nomeDigitado, com Obesidade Grau III, seu IMC é  ${ImcRetorno.toStringAsFixed(2)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        actions: <Widget>[
          IconButton(onPressed: _resetFields, icon: const Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              children: [
                Container(
                  child: Image.network(
                    'https://www.tjdft.jus.br/informacoes/programas-projetos-e-acoes/pro-vida/dicas-de-saude/pilulas-de-saude/o-que-o-indice-de-massa-corporal-imc-diz-sobre-sua-saude/@@images/6b4a3003-7224-4a8c-b001-14e6f2ecca9f.png',
                  ),
                ),
                const SizedBox(
                  height: 50,
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
                    keyboardType: TextInputType.number,
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
                    keyboardType: TextInputType.number,
                    controller: pesoController,
                    decoration: const InputDecoration(
                      hintText: 'Peso KG',
                      suffixText: 'Ex. 90',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 8, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            await storage
                                .setDadosCasdastraisNome(nomeController.text);
                            await storage.setDadosCadastraisaltura(
                                double.parse(alturaController.text));

                            _calculate();
                            carregarDados();
                            repository.iniciarBancoDeDados();
                          },
                          child: const Text('Calcular'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            await storage
                                .setDadosCasdastraisNome(nomeController.text);
                            await storage.setDadosCadastraisaltura(
                                double.parse(alturaController.text));
                            final imcSqliteModel = ImcSqliteModel(
                              id: 0,
                              nome: nomeController.text,
                              peso: double.parse(pesoController.text),
                              altura: double.parse(alturaController.text),
                              dataCalculo: DateTime.now(),
                            );

                            repository.salvar(imcSqliteModel);
                          },
                          child: const Text('Salvar'),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text('$_infoText'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HistoricIMCScreen()));
                    },
                    child: const Text('Histórico'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
