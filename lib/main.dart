import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie List',
      theme: ThemeData(
        primaryColor: Color(0xFFdb0000), // Cor principal
        scaffoldBackgroundColor: Color(0xFF000000), // Fundo da aplicação
        appBarTheme: AppBarTheme(
          color: Color(0xFF831010), // Cor do AppBar
          titleTextStyle: TextStyle(
            color: Color(0xFFFFFFFF), // Texto do AppBar
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFdb0000), // Cor do botão flutuante
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Color(0xFFffffff)), // Cor do texto principal
          titleMedium: TextStyle(color: Color(0xFF564d4d)), // Cor do subtítulo
        ),
      ),
      home: HomePage(),
    );
  }
}
