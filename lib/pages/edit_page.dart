// edit_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/movie_controller.dart';
import '../models/movie.dart';

class EditPage extends StatelessWidget {
  final Movie movie; // Filme a ser editado
  final MovieController movieController = Get.find(); // Controlador de filmes
  final TextEditingController titleController; // Controlador para o título
  final TextEditingController descriptionController; // Controlador para a descrição
  bool isWatched; // Variável para armazenar o status

  // Construtor da página de edição
  EditPage({required this.movie})
      : titleController = TextEditingController(text: movie.title),
        descriptionController = TextEditingController(text: movie.description),
        isWatched = movie.isWatched; // Inicializa o status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Filme'),
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
                // Cria um novo filme com as informações editadas
                final updatedMovie = Movie(
                  id: movie.id,
                  title: titleController.text,
                  description: descriptionController.text,
                  isWatched: isWatched, // Passa o status para o filme atualizado
                );
                movieController.updateMovie(updatedMovie); // Atualiza o filme no controlador
                Get.back(); // Retorna à página anterior
              },
              child: Text('Salvar'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Exclui o filme após confirmação
                Get.defaultDialog(
                  title: 'Confirmar Exclusão',
                  middleText: 'Você tem certeza que deseja excluir este filme?',
                  confirm: ElevatedButton(
                    onPressed: () {
                      movieController.deleteMovie(movie.id); // Chama o método de exclusão do controlador
                      Get.back(); // Fecha o diálogo de confirmação
                      Get.back(); // Retorna à página inicial
                    },
                    child: Text('Confirmar'),
                  ),
                  cancel: ElevatedButton(
                    onPressed: () {
                      Get.back(); // Fecha o diálogo sem excluir
                    },
                    child: Text('Cancelar'),
                  ),
                );
              },
              child: Text('Excluir Filme'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red), // Cor do botão de exclusão
            ),
          ],
        ),
      ),
    );
  }
}
