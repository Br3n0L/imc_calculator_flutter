import 'package:shared_preferences/shared_preferences.dart';

enum StorageKeys {
  CHAVE_DADOS_CADASTRAIS_NOME,
  CHAVE_DADOS_CADASTRAIS_ALTURA,
  CHAVE_DADOS_CADASTRAIS_PESO,
}

class AppStorageService {
  Future<void> setDadosCasdastraisNome(String nome) async {
    await _setString(StorageKeys.CHAVE_DADOS_CADASTRAIS_NOME.toString(), nome);
  }

  Future<String> getDadosCadastraisNome() async {
    return _getString(StorageKeys.CHAVE_DADOS_CADASTRAIS_NOME.toString());
  }

  Future<void> setDadosCadastraisaltura(double value) async {
    await _setDouble(
        StorageKeys.CHAVE_DADOS_CADASTRAIS_ALTURA.toString(), value);
  }

  Future<double> getDadosCadastraisaltura() async {
    return _getDouble(StorageKeys.CHAVE_DADOS_CADASTRAIS_ALTURA.toString());
  }
}

//--------------------------------------------------------------------------------//

_setString(String chave, String value) async {
  var storage = await SharedPreferences.getInstance();
  storage.setString(chave, value);
}

Future<String> _getString(String chave) async {
  var storage = await SharedPreferences.getInstance();
  return storage.getString(chave) ?? "";
}

Future<double> _getDouble(String chave) async {
  var storage = await SharedPreferences.getInstance();
  return storage.getDouble(chave) ?? 0;
}

_setDouble(String chave, double value) async {
  var storage = await SharedPreferences.getInstance();
  storage.setDouble(chave, value);
}
