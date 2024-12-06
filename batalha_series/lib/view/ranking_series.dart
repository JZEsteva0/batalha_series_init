import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:batalha_series/controller/controller_serie.dart';

class RankingView extends StatelessWidget {
  final SeriesController controller = SeriesController();

  void _gerarRelatorio(BuildContext context) async {
    try {
      final pdfFile = await controller.gerarRelatorioPDF(); // Retorna o arquivo gerado
      Share.shareFiles([pdfFile.path], text: 'Confira o ranking das séries!');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao gerar PDF: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ranking = controller.getRanking();

    return Scaffold(
      appBar: AppBar(title: Text('Ranking de Séries')),
      body: ranking.isEmpty
          ? Center(child: Text('Nenhuma batalha foi realizada ainda.'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: ranking.length,
                    itemBuilder: (context, index) {
                      final serie = ranking[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(serie.capaUrl),
                        ),
                        title: Text(serie.nome),
                        subtitle: Text('${serie.vitorias} vitórias'),
                        trailing: Text('#${index + 1}'),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton.icon(
                    onPressed: () => _gerarRelatorio(context),
                    icon: Icon(Icons.picture_as_pdf),
                    label: Text('Gerar Relatório PDF'),
                  ),
                ),
              ],
            ),
    );
  }
}
