// add_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/movie_controller.dart';
import '../models/movie.dart';

class AddPage extends StatelessWidget {
  final MovieController movieController = Get.find(); // Controlador de filmes
  final TextEditingController titleController = TextEditingController(); // Controlador para o título
  final TextEditingController descriptionController = TextEditingController(); // Controlador para a descrição
  bool isWatched = false; // Variável para armazenar o status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Filme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Assistido?'),
                Switch(
                  value: isWatched,
                  onChanged: (value) {
                    isWatched = value; // Atualiza o status
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Cria um novo filme com as informações inseridas
                final movie = Movie(
                  id: DateTime.now().toString(), // Gera um ID único para o novo filme
                  title: titleController.text,
                  description: descriptionController.text,
                  isWatched: isWatched, // Passa o status para o novo filme
                );
                movieController.addMovie(movie); // Adiciona o filme ao controlador
                Get.back(); // Retorna à página anterior
              },
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
