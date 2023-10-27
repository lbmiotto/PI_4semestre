import 'package:flutter/material.dart';
import 'package:app_flutter/telas/login_page.dart';
import 'package:app_flutter/telas/inicio_page.dart';
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
      home: SobrePage(),
    );
  }
}

class SobrePage extends StatelessWidget {
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
                        leading: Icon(Icons.home),
                        title: Text('Início'),
                        onTap: () {
                          // Ação ao selecionar "Início" no Drawer
                          // Adicione sua ação aqui
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Ver Perfil'),
                        onTap: () {
                          // Ação ao selecionar "Ver Perfil" no Drawer
                          // Adicione sua ação aqui
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.business),
                        title: Text('Organizações'),
                        onTap: () {
                          // Ação ao selecionar "Organizações" no Drawer
                          // Adicione sua ação aqui
                        },
                      ),
                      ListTile(
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
          children: <Widget>[
            // Imagem
            Image.asset(
              'img/sobre_globo.png',
              width: 200.0,
              height: 200.0,
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(100),
              child: Text(
                'Bem-vindo ao sistema, a solução abrangente para gerenciar organizações e projetos de forma eficaz. Com nossa plataforma intuitiva, você pode criar, visualizar e manter informações detalhadas sobre organizações, ao mesmo tempo que simplifica o planejamento, execução e acompanhamento de projetos, tudo em um único lugar. Oferecemos integração total, suporte de qualidade e a visão de tornar o gerenciamento colaborativo acessível a todos. Estamos à disposição para ajudar.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InicioPage(),
                  ),
                );
              },
              child: Text('Ir para a página de início'),
            )
          ],
        ),
      ),
    );
  }
}
