import 'package:flutter/material.dart';
import 'package:batalha_series/view/cadastro_serie.dart';
import 'package:batalha_series/view/combate_serie.dart';
import 'package:batalha_series/view/ranking_series.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Batalha de Séries')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CadastrarSerieView()),
                );
              },
              child: Text('Cadastrar Série'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BatalhaView()),
                );
              },
              child: Text('Iniciar Batalha'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RankingView()),
                );
              },
              child: Text('Ver Ranking'),
            ),
          ],
        ),
      ),
    );
  }
}
