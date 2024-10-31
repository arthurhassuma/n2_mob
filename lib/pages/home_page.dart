// home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/movie_controller.dart';
import 'add_page.dart';
import 'edit_page.dart';

class HomePage extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
      ),
      body: Obx(() {
        // Constrói uma lista de filmes observável
        return ListView.builder(
          itemCount: movieController.movies.length,
          itemBuilder: (context, index) {
            final movie = movieController.movies[index];
            return ListTile(
              title: Text(movie.title),
              subtitle: Text(movie.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Texto que mostra o status
                  Text(
                    movie.isWatched ? 'Assistido' : 'A Assistir',
                    style: TextStyle(
                      color: movie.isWatched ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10), // Espaçamento entre o texto e o switch
                  Switch(
                    value: movie.isWatched,
                    onChanged: (value) {
                      movie.isWatched = value; // Atualiza o status
                      movieController.updateMovie(movie); // Atualiza o filme no controlador
                    },
                  ),
                ],
              ),
              onTap: () {
                // Navega para a página de edição ao tocar no item
                Get.to(EditPage(movie: movie));
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        // Navega para a página de adição ao pressionar o botão
        onPressed: () => Get.to(AddPage()),
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.green,
      ),
    );
  }
}
