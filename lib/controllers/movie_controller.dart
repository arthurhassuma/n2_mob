import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/movie.dart';

// Controlador para gerenciar o estado dos filmes
class MovieController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Instância do Firestore
  var movies = <Movie>[].obs; // Lista observável de filmes

  @override
  void onInit() {
    super.onInit();
    fetchMovies(); // Chama o método para buscar filmes ao iniciar o controlador
  }

  // Busca os filmes do Firestore e atualiza a lista observável
  void fetchMovies() {
    _firestore.collection('movies').snapshots().listen((snapshot) {
      // Escuta as mudanças na coleção de filmes
      movies.value = snapshot.docs
          .map((doc) => Movie.fromMap(doc.data(), doc.id)) // Mapeia cada documento para um objeto Movie
          .toList(); // Converte para uma lista
    });
  }

  // Adiciona um novo filme ao Firestore
  Future<void> addMovie(Movie movie) async {
    await _firestore.collection('movies').add(movie.toMap()); // Adiciona o filme ao Firestore
    Get.snackbar('Sucesso', 'Filme adicionado com sucesso!', // Exibe uma mensagem de sucesso
        snackPosition: SnackPosition.BOTTOM);
  }

  // Atualiza um filme existente no Firestore
  Future<void> updateMovie(Movie updatedMovie) async {
    await _firestore.collection('movies').doc(updatedMovie.id).update(updatedMovie.toMap()); // Atualiza o filme no Firestore
    Get.snackbar('Sucesso', 'Filme atualizado com sucesso!', // Exibe uma mensagem de sucesso
        snackPosition: SnackPosition.BOTTOM);
  }

  // Deleta um filme do Firestore
  Future<void> deleteMovie(String id) async {
    await _firestore.collection('movies').doc(id).delete(); // Remove o filme do Firestore
    Get.snackbar('Sucesso', 'Filme deletado com sucesso!', // Exibe uma mensagem de sucesso
        snackPosition: SnackPosition.BOTTOM);
  }
}
