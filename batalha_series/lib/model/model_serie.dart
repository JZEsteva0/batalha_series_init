class Serie {
  final String id;
  final String nome;
  final String genero;
  final String descricao;
  final String capaUrl;
  int pontuacao;
  int vitorias;

  Serie({
    required this.id,
    required this.nome,
    required this.genero,
    required this.descricao,
    required this.capaUrl,
    this.pontuacao = 0,
    this.vitorias = 0,
  });
}
