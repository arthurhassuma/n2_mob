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
        return ListView.builder(
          itemCount: movieController.movies.length,
          itemBuilder: (context, index) {
            final movie = movieController.movies[index];
            return ListTile(
              title: Text(
                movie.title,
                style: TextStyle(color: Color(0xFFFFFFFF)), // Título branco
              ),
              subtitle: Text(
                movie.description,
                style: TextStyle(color: Color(0xFF564d4d)), // Subtítulo cinza
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    movie.isWatched ? 'Assistido' : 'A Assistir',
                    style: TextStyle(
                      color: movie.isWatched ? Color(0xFF831010) : Color(0xFFdb0000),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Switch(
                    activeColor: Color(0xFFdb0000), // Cor do switch
                    value: movie.isWatched,
                    onChanged: (value) {
                      movie.isWatched = value;
                      movieController.updateMovie(movie);
                    },
                  ),
                ],
              ),
              onTap: () {
                Get.to(EditPage(movie: movie));
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(AddPage()),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
