class Video {
  final String id;
  final String titulo;
  final String descricao;
  final String imagem;
  final String canal;
  Video({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.imagem,
    required this.canal,
  });

  factory Video.converterJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      descricao: json["snippet"]["description"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelTitle"],
    );
  }
}
