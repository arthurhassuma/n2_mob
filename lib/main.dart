// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Importa as configurações do Firebase
import 'package:get/get.dart';
import 'pages/home_page.dart'; // Certifique-se de que o caminho está correto

// Método para inicializar o Firebase e o app
void main() async {
  // Garante que os bindings do Flutter estão inicializados
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Firebase com as opções específicas da plataforma
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Executa o aplicativo Flutter
  runApp(const MyApp());
}

// Método do App em si
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Título do aplicativo
      title: 'Movies CRUD',

      // Tema do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.red,
        hintColor: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.red,
          toolbarTextStyle: TextTheme(
            titleLarge: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ).bodyMedium,
          titleTextStyle: TextTheme(
            titleLarge: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ).titleLarge,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.green,
        ),
      ),

      // Página inicial do aplicativo
      home: HomePage(),
    );
  }
}
