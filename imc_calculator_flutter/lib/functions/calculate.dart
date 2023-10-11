import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  TextEditingController alturaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  String? _infoText = 'Informe seus dados';
  String? imc;

  void _resetFields() {
    alturaController.text = '';
    nomeController.text = '';
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
    return const Placeholder();
  }
}
