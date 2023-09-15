import 'package:imc_flutter/interfaces/i_pessoa.dart' as pessoa;

class Pessoa implements pessoa.PessoaInterface {
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;

  @override
  void setDate(String nome) {
    if (nome.length < 3) {
      throw ArgumentError("'nome' precisa ter ao menos 3 letras!");
    }
    _nome = nome;
  }

  @override
  void setAltura(String altura) {
    try {
      _altura = double.parse(altura);
    } catch (err) {
      throw ArgumentError("O valor de entarda para a 'altura' é inválido");
    }
    if (_altura.isNaN) {
    } else if (_altura <= 0) {
      throw ArgumentError("'Altura' precisa ser maior que '0'!");
    }
  }

  @override
  void setPeso(String peso) {
    try {
      _peso = double.parse(peso);
    } catch (err) {
      throw ArgumentError("O valor de entrada para a 'peso' é inválido");
    }
    if (_peso <= 0) {
      throw ArgumentError("'Peso' precisa ser maior que '0'!");
    }
  }

  @override
  double getAltura() => _altura;

  @override
  String getDate() => _nome;

  @override
  double getPeso() => _peso;
}
