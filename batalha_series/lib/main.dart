import 'package:flutter/material.dart';
import 'package:batalha_series/view/home_page.dart';
import 'package:batalha_series/view/cadastro_serie.dart';
import 'package:batalha_series/view/combate_serie.dart';
import 'package:batalha_series/view/ranking_series.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Batalha de Séries',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        '/cadastrar-serie': (context) => CadastrarSerieView(),
        '/batalha': (context) => BatalhaView(),
        '/ranking': (context) => RankingView(),
      },
    );
  }
}
