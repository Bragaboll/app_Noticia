import 'package:app_noticias/noticia_detalhe.dart';
import 'package:app_noticias/noticia.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/detalhe': (context) => NoticiaDetalhe(
            item: ModalRoute.of(context)?.settings.arguments as Noticia),
      },
    );
  }
}
