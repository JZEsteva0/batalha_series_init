import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:batalha_series/model/model_serie.dart';

class PDFGenerator {
  Future<File> generatePDF(List<Serie> series) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Relatório - Batalha de Séries', style: pw.TextStyle(fontSize: 24)),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                context: context,
                data: <List<String>>[
                  ['Nome', 'Vitórias', 'Gênero', 'Descrição'],
                  ...series.map((s) => [s.nome, '${s.vitorias}', s.genero, s.descricao]),
                ],
              ),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/relatorio_batalha_series.pdf');
    await file.writeAsBytes(await pdf.save());
    return file;
  }
}
