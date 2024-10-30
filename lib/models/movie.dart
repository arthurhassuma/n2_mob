import 'package:cloud_firestore/cloud_firestore.dart';

// Criação do modelo de filme
class Movie {
  String id; // ID único do filme
  String title; // Título do filme
  String description; // Descrição do filme
  bool isWatched; // Atributo que indica se o filme foi assistido ou não

  // Construtor da classe Movie
  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.isWatched, // Inicializa o status assistido
  });

  // Método que cria um filme a partir de um mapa (ex: do Firestore)
  factory Movie.fromMap(Map<String, dynamic> data, String documentId) {
    return Movie(
      id: documentId,
      title: data['title'] ?? '', // Atribui o título ou uma string vazia se não existir
      description: data['description'] ?? '', // Atribui a descrição ou uma string vazia se não existir
      isWatched: data['isWatched'] ?? false, // Inicializa como false se não estiver definido
    );
  }

  // Método que converte um objeto Movie em um mapa (usado para salvar no Firestore)
  Map<String, dynamic> toMap() {
    return {
      'title': title, // Inclui o título no mapa
      'description': description, // Inclui a descrição no mapa
      'isWatched': isWatched, // Inclui o status no mapa
    };
  }
}
