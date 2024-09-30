import 'package:flutter/material.dart';
import 'package:myapp/search/customSearchDelegate.dart';
import 'package:myapp/pages/biblioteca_page.dart';
import 'package:myapp/pages/emAlta_page.dart';
import 'package:myapp/pages/inscricao_page.dart';
import 'package:myapp/pages/Inicio_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String pesquisa = "Noticias Brasil";

  int _indiceAtual = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(
        pesquisa: pesquisa,
      ),
      const EmAlta(),
      const Inscricoes(),
      const Biblioteca(),
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey),
        title: Image.asset(
          "assets/images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final String? result = await showSearch<String?>(
                context: context,
                delegate: CustomSearchDelegate(),
              );
              if (result != null) {
                setState(() {
                  pesquisa = result;
                });
              }
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(8), child: telas[_indiceAtual]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (int indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            label: "Inicio",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Em Alta",
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            label: "Inscrições",
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
