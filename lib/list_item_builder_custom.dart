import 'package:flutter/material.dart';

Widget listItemBuilder(Map<String, dynamic> content) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.green[100]),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
    child: Row(children: [
      Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Peso (kg): ${content['peso']}"),
            Text("Altura (cm): ${content['altura']}"),
            Text("IMC: ${content['imc'].toStringAsFixed(2)}"),
          ],
        ),
      ),
      Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${content['date']}",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "${content['situação']}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    ]),
  );
}
