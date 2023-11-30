import 'package:flutter/material.dart';
import 'package:app_flutter/telas/login_page.dart';
import 'package:app_flutter/telas/perfil_page.dart';
import 'package:app_flutter/telas/organizacao_page.dart';
import 'package:app_flutter/telas/sobre_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InicioPage(),
    );
  }
}

class InicioPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/inicio.png',
                    width: 400,
                    height: 400,
                  ),
                  Text(
                    'Boas-vindas à nossa aplicação! Estamos felizes em tê-lo aqui. Esperamos que aproveite cada recurso ao máximo.',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 70),
                  Text(
                    'Veja algumas das nossas funções:',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  _buildCard('Gerenciamento de Usuários',
                      'Esta função permite a administração completa dos usuários da sua aplicação. Você pode criar, editar, excluir e gerenciar os usuários. Isso é útil para controlar o acesso e as atividades de cada pessoa que utiliza a aplicação individualmente e controlar quem tem acesso aos dados'),
                  _buildCard('Gerenciamento de Organização',
                      'A função de gerenciamento de organização possibilita o controle e a organização das informações relacionadas à estrutura da sua empresa ou projeto. Você pode definir hierarquias, departamentos e categorias para facilitar a gestão e a análise de dados.'),
                  _buildCard('Gerenciamento de Projetos',
                      'Com essa função, você pode criar, atualizar e monitorar todos os aspectos dos projetos em andamento na sua aplicação. Isso inclui atribuir tarefas, definir metas, acompanhar o progresso e compartilhar informações relevantes entre os membros da equipe.'),
                  SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ));
  }
}

Widget _buildCard(String title, String text) {
  return Container(
    width: 440,
    child: Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(text),
          ],
        ),
      ),
    ),
  );
}
