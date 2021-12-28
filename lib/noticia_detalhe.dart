import 'package:flutter/material.dart';

import 'package:app_noticias/noticia.dart';

class NoticiaDetalhe extends StatelessWidget {
  final Noticia item;
  const NoticiaDetalhe({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe da Noticia;'),
      ),
      body: ListView(
        children: [
          Image.network(
            'http://104.131.18.84/notice${item.urlImg}',
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              item.tittle ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(item.description ?? ''),
          ),
        ],
      ),
    );
  }
}
