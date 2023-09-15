import "dart:math";
import 'package:imc_flutter/interfaces/i_pessoa.dart' as interfaces;

class CalcularIMC {
  interfaces.PessoaInterface? _pessoa;

  CalcularIMC({required interfaces.PessoaInterface pessoa}) {
    _pessoa = pessoa;
  }

  Map<String, dynamic> execute() {
    String result = "";
    int alertNivel = 0;
    double imc = _pessoa!.getPeso() / pow(_pessoa!.getAltura(), 2);

    Map<String, List> values = {
      //key:[value-imc, alert-nivel]
      "Magreza grave": [16, 3],
      "Magreza moderada": [17, 2],
      "Magreza leve": [18.5, 1],
      "Saudável": [25, 0],
      "Sobrepeso": [30, 1],
      "Obesidade Grau 1": [35, 2],
      "Obesidade Grau 2 - Severa": [40, 3],
    };

    if (imc > 40) {
      result = "Obesidade Grau 3 - Mórbida";
      alertNivel = 4;
    } else {
      result = values.entries.where((e) => imc < e.value[0]).first.key;
      alertNivel = values[result]![1];
    }

    return {'alerta': alertNivel, 'result': result, 'imc': imc};
  }
}
