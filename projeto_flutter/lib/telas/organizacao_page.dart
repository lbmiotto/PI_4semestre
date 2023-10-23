import 'package:flutter/material.dart';
import 'package:app_flutter/telas/login_page.dart';
import 'package:app_flutter/telas/perfil_page.dart';
import 'package:app_flutter/telas/projeto_page.dart';

void main() {
  runApp(MinhaApp());
}

class MinhaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrganizacaoPage(),
    );
  }
}

class OrganizacaoPage extends StatelessWidget {
  final List<Projeto> projetos = [
    Projeto(
    "Projeto 1",
    "Descrição do Projeto 1",
    "Nome da Organização 1",
    "Endereço do Projeto 1",
    DateTime.now(),
    DateTime.now(),
    true,
  ),
  Projeto(
    "Projeto 2",
    "Descrição do Projeto 2",
    "Nome da Organização 2",
    "Endereço do Projeto 2",
    DateTime.now(),
    DateTime.now(),
    true,
  ),
  Projeto(
    "Projeto 3",
    "Descrição do Projeto 3",
    "Nome da Organização 3",
    "Endereço do Projeto 3",
    DateTime.now(),
    DateTime.now(),
    true,
  ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  "Sua Organização",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.person, color: Colors.blue),
                        SizedBox(width: 8),
                        Text("Perfil", style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                    value: "perfil",
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app, color: Colors.red),
                        SizedBox(width: 8),
                        Text("Sair", style: TextStyle(color: Colors.red)),
                      ],
                    ),
                    value: "sair",
                  ),
                ];
              },
              onSelected: (value) {
                if (value == "perfil") {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaPerfil()));
                } else if (value == "sair") {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaDeLogin()));
                }
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            
            SizedBox(height: 20),
            Text(
              "Nome da Organização",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[200],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: projetos.map((projeto) {
                return Container(
                  width: 900,
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            projeto.nome,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(projeto.descricao),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetalhesProjetoPage(projeto),
                                    ),
                                  );
                                },
                                child: Text("Ver mais"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
