import 'package:flutter/material.dart';
import 'package:app_flutter/telas/login_page.dart';
import 'package:app_flutter/telas/inicio_page.dart';
import 'package:app_flutter/telas/perfil_page.dart';
import 'package:app_flutter/telas/organizacao_page.dart';
import 'package:app_flutter/telas/sobre_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: DetalhesProjetoPage(
      Projeto(
        "Nome do Projeto",
        "Descrição do Projeto",
        "Nome da Organização",
        "Endereço do Projeto",
        DateTime.now(),
        DateTime.now(),
        true,
      ),
    ),
  ));
}

class Projeto {
  final String nome;
  final String descricao;
  final String organizacao;
  final String endereco;
  final DateTime dataCriacao;
  final DateTime dataInicio;
  final bool statusLeitura;

  Projeto(
    this.nome,
    this.descricao,
    this.organizacao,
    this.endereco,
    this.dataCriacao,
    this.dataInicio,
    this.statusLeitura,
  );
}

class DetalhesProjetoPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Projeto projeto;

  DetalhesProjetoPage(this.projeto);

  Future<void> obterLinkDoMapa(int mapaId) async {
  final response = await http.get(
    Uri.parse("http://localhost:8000/maps/$mapaId/"),
  );

  if (response.statusCode == 200) {
    final linkDoMapa = json.decode(response.body)['link_do_mapa'];
    print("Seu mapa foi encontrado");

    _abrirNovaAba(linkDoMapa);
  } else {
    print("Erro ao obter link do mapa: ${response.statusCode}");
  }
}


  void _abrirNovaAba(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      print("Erro ao abrir o link do mapa: $link");
    }
  }

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
                decoration: BoxDecoration(color: Colors.blue),
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
                      ListTile(
                        // ínicio
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
                      ListTile(
                        // Ver Perfil
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
                      ListTile(
                        // Organizações
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
                      ListTile(
                        // Sobre
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
                      ListTile(
                        // Icone Sair
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Alinhar itens ao centro
              children: <Widget>[
                Icon(Icons.business, size: 36, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  projeto.nome,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Alinhar itens ao centro
              children: <Widget>[
                Icon(Icons.description, size: 36, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  projeto.descricao,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Alinhar itens ao centro
              children: <Widget>[
                Icon(Icons.people, size: 36, color: Colors.orange),
                SizedBox(width: 8),
                Text(
                  projeto.organizacao,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Alinhar itens ao centro
              children: <Widget>[
                Icon(Icons.location_on, size: 36, color: Colors.red),
                SizedBox(width: 8),
                Text(
                  projeto.endereco,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Alinhar itens ao centro
              children: <Widget>[
                Icon(Icons.date_range, size: 36, color: Colors.purple),
                SizedBox(width: 8),
                Text(
                  "Data de Criação: ${projeto.dataCriacao.toLocal()}",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Alinhar itens ao centro
              children: <Widget>[
                Icon(Icons.date_range, size: 36, color: Colors.purple),
                SizedBox(width: 8),
                Text(
                  "Data de Início: ${projeto.dataInicio.toLocal()}",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Alinhar itens ao centro
              children: <Widget>[
                Icon(Icons.book,
                    size: 36,
                    color: projeto.statusLeitura ? Colors.green : Colors.red),
                SizedBox(width: 8),
                Text(
                  "Status de Leitura: ${projeto.statusLeitura ? 'Lido' : 'Não Lido'}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                obterLinkDoMapa(6);
              },
              child: Text("Ver Mapa"),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
