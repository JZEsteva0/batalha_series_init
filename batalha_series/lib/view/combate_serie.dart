import 'package:flutter/material.dart';
import 'package:batalha_series/controller/controller_serie.dart';
import 'package:batalha_series/model/model_serie.dart';

class BatalhaView extends StatelessWidget {
  final SeriesController controller = SeriesController();

  @override
  Widget build(BuildContext context) {
    final series = controller.series;

    if (series.length < 2) {
      return Scaffold(
        appBar: AppBar(title: Text('Combate')),
        body: Center(child: Text('Cadastre pelo menos duas séries.')),
      );
    }

    final Serie serie1 = series[0];
    final Serie serie2 = series[1];

    return Scaffold(
      appBar: AppBar(title: Text('Batalha')),
      body: Column(
        children: [
          Expanded(
            child: ListTile(
              title: Text(serie1.nome),
              subtitle: Text(serie1.descricao),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(serie2.nome),
              subtitle: Text(serie2.descricao),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.registrarVitoria(serie1.id);
              Navigator.pop(context);
            },
            child: Text('${serie1.nome} venceu!'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.registrarVitoria(serie2.id);
              Navigator.pop(context);
            },
            child: Text('${serie2.nome} venceu!'),
          ),
        ],
      ),
    );
  }
}
