import 'package:flutter/material.dart';
import 'package:app_flutter/telas/login_page.dart';
import 'package:app_flutter/telas_ghost/inicio_ghost.dart';
import 'package:app_flutter/telas_ghost/perfil_ghost.dart';
import 'package:app_flutter/telas_ghost/organizacao_ghost.dart';
import 'package:app_flutter/telas_ghost/sobre_ghost.dart';

void main() {
  runApp(MaterialApp(
    home: DetalhesProjetoPageGhost(
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

class DetalhesProjetoPageGhost extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Projeto projeto;

  DetalhesProjetoPageGhost(this.projeto);

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
                      ListTile( // ínicio
                        leading: Icon(Icons.home),
                        title: Text('Início'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InicioPageGhost(),
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
                              builder: (context) => PaginaPerfilGhost(),
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
                              builder: (context) => OrganizacaoPageGhost(),
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
                              builder: (context) => SobrePageGhost(),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Alinhar itens ao centro
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
              mainAxisAlignment: MainAxisAlignment.center, // Alinhar itens ao centro
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
              mainAxisAlignment: MainAxisAlignment.center, // Alinhar itens ao centro
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
              mainAxisAlignment: MainAxisAlignment.center, // Alinhar itens ao centro
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
              mainAxisAlignment: MainAxisAlignment.center, // Alinhar itens ao centro
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
              mainAxisAlignment: MainAxisAlignment.center, // Alinhar itens ao centro
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
              mainAxisAlignment: MainAxisAlignment.center, // Alinhar itens ao centro
              children: <Widget>[
                Icon(Icons.book, size: 36, color: projeto.statusLeitura ? Colors.green : Colors.red),
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
                // Adicione ação para o botão "Ver Mapa"
              },
              child: Text("Ver Mapa"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Adicione ação para o botão "Documentos"
              },
              child: Text("Documentos"),
            ),
          ],
        ),
      ),
    );
  }
}