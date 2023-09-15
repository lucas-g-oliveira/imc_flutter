import 'package:imc_flutter/classes/IMC.dart';
import 'package:imc_flutter/interfaces/i_pessoa.dart';

class Storage {
  List<Map<String, dynamic>> data = [];

  get getAll => data;

  set removeById(String id) {
    data = data.where((element) => element["id"] != id)
        as List<Map<String, dynamic>>;
  }

  void add(PessoaInterface people) {
    var imc = CalcularIMC(pessoa: people).execute();
    var d = DateTime.now();
    Map<String, dynamic> user = {
      "date":
          "${d.day}/${d.month}/${d.year} - ${d.hour}:${d.minute}:${d.second}",
      "peso": people.getPeso(),
      "altura": people.getAltura(),
      "imc": imc['imc'],
      "situação": imc['result'],
    };

    data.add(user);
  }
}
