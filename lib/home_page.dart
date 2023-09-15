import 'package:flutter/material.dart';
import 'package:imc_flutter/classes/Pessoa.dart';
import 'package:imc_flutter/list_item_builder_custom.dart';
import 'package:imc_flutter/model/storage_simulator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dataList = Storage();
  Pessoa pessoa = Pessoa();

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  bool validadeFields = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) =>
              listItemBuilder(dataList.getAll[index]),
          itemCount: dataList.getAll.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: const Text('Novo calculo de IMC',
                      textAlign: TextAlign.center),
                  content: Wrap(
                    children: [
                      Column(children: [
                        const Text("Peso(Kg)"),
                        TextField(
                            onChanged: (value) => {
                                  validadeFields = (pesoController.text != "" ||
                                      alturaController.text != "")
                                },
                            controller: pesoController,
                            keyboardType: TextInputType.number),
                        const SizedBox(height: 10, width: 10),
                        const Text("Altura(M)"),
                        TextField(
                          onChanged: (value) => {
                            validadeFields = (pesoController.text != "" ||
                                alturaController.text != "")
                          },
                          controller: alturaController,
                          keyboardType: TextInputType.number,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () {
                                  pesoController.text = "";
                                  alturaController.text = "";
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Cancelar",
                                  style: TextStyle(color: Colors.red),
                                )),
                            TextButton(
                                onPressed: !validadeFields
                                    ? () {
                                        pessoa.setAltura(alturaController.text);
                                        pessoa.setPeso(pesoController.text);
                                        dataList.add(pessoa);
                                        Navigator.pop(context);
                                        pesoController.text = "";
                                        alturaController.text = "";
                                        setState(() {});
                                      }
                                    : () {},
                                child: const Text(
                                  "Calcular",
                                )),
                          ],
                        )
                      ]),
                    ],
                  ),
                );
              });
        },
        tooltip: null,
        child: const Icon(Icons.add),
      ),
    );
  }
}
