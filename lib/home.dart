import 'dart:convert';

import 'package:app_noticias/noticia_item.dart';
import 'package:app_noticias/noticia.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Noticia> noticiaList = [];
  bool loading = true;
  @override
  void initState() {
    carregarNoticia();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('App de Noticias'),
        ),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: noticiaList.length,
              itemBuilder: (context, index) {
                return NoticiaItem(
                  item: noticiaList[index],
                );
              }),
    );
  }

  void carregarNoticia() {
    var url = Uri.parse('http://104.131.18.84/notice/news/recent/');
    http.get(url).then((response) {
      if (response.statusCode == 200) {
        Map json = const JsonDecoder().convert(response.body);
        setState(() {
          noticiaList = json['data'].map<Noticia>((item) {
            return Noticia.fromJson(item);
          }).toList();
          loading = false;
        });
      }
    });
  }
}
