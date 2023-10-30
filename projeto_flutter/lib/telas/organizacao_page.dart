import 'package:flutter/material.dart';
import 'package:app_flutter/telas/login_page.dart';
import 'package:app_flutter/telas/inicio_page.dart';
import 'package:app_flutter/telas/perfil_page.dart';
import 'package:app_flutter/telas/sobre_page.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  'Nome',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  'seu.email@example.com',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Color(0xFF4E7CBF),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    children: <Widget>[
                      ListTile( // ínicio
                        leading: Icon(Icons.home),
                        title: Text('Início'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InicioPage(),
                            ),
                          );
                        },
                      ),
                      ListTile( // Ver Perfil
                        leading: Icon(Icons.person),
                        title: Text('Ver Perfil'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaginaPerfil(),
                            ),
                          );
                        },
                      ),
                      ListTile( // Organizações
                        leading: Icon(Icons.business),
                        title: Text('Organizações'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrganizacaoPage(),
                            ),
                          );
                        },
                      ),
                      ListTile( // Sobre
                        leading: Icon(Icons.info),
                        title: Text('Sobre'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SobrePage(),
                            ),
                          );
                        },
                      ),
                      Divider(),
                      ListTile( // Icone Sair
                        title: Text(
                          'Sair',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaginaDeLogin(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
