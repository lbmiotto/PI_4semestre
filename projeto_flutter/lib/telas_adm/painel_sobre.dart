import 'package:flutter/material.dart';
import 'package:app_flutter/telas/login_page.dart';
import 'package:app_flutter/telas_adm/painel_organizacao.dart';
import 'package:app_flutter/telas_adm/painel_projetos.dart';
import 'package:app_flutter/telas_adm/painel_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VizualizarSobre(),
    );
  }
}

class VizualizarSobre extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
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
                        leading: Icon(Icons.person),
                        title: Text('Gerenciamento de Usuários'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VisualizarUsuario(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.business),
                        title: Text('Gerenciamento de Organização'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VisualizarOrganizacao(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.photo_album_rounded),
                        title: Text('Gerenciamento de Projeto'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VisualizarProjetos(),
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
              'img/sobre.png',
              width: 500.0,
              height: 500.0,
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
          ],
        ),
      ),
    );
  }
}
