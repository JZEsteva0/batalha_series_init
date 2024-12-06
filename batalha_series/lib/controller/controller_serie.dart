import 'dart:io';
import 'package:batalha_series/model/model_serie.dart';
import 'package:batalha_series/utils/gerador_pdf.dart';

class SeriesController {
  final List<Serie> _series = [];

  List<Serie> get series => List.unmodifiable(_series);

  void adicionarSerie(Serie serie) {
    _series.add(serie);
  }

  void registrarVitoria(String id) {
    final serie = _series.firstWhere((s) => s.id == id, orElse: () => throw Exception('Série não encontrada.'));
    serie.vitorias++;
  }

  List<Serie> getRanking() {
    final ranking = List<Serie>.from(_series);
    ranking.sort((a, b) => b.vitorias.compareTo(a.vitorias));
    return ranking;
  }

  Future<File> gerarRelatorioPDF() async {
    final pdfGenerator = PDFGenerator();
    final pdfFile = await pdfGenerator.generatePDF(_series);
    return pdfFile; // Retorna o arquivo gerado
  }
}
