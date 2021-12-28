import 'package:app_noticias/noticia.dart';
import 'package:flutter/material.dart';

class NoticiaItem extends StatelessWidget {
  const NoticiaItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Noticia item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/detalhe', arguments: item);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.network(
                'http://104.131.18.84/notice${item.urlImg}',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      item.tittle ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(item.description ?? ''),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
