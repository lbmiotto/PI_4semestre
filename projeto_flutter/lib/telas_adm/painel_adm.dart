import 'package:flutter/material.dart';
import 'package:app_flutter/telas/login_page.dart';
import 'package:app_flutter/telas_adm/painel_organizacao.dart';
import 'package:app_flutter/telas_adm/painel_projetos.dart';
import 'package:app_flutter/telas_adm/painel_user.dart';
import 'package:app_flutter/telas_adm/painel_sobre.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PainelAdm(),
    );
  }
}

class PainelAdm extends StatelessWidget {
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Painel de Administrador de Projetos",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 700,
                child: Text(
                  "Acesse rapidamente informações essenciais sobre seus projetos, como status, prazos e membros da equipe. Tenha uma visão global do andamento de todos os projetos em um único local, facilitando o acompanhamento.",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 90),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                          MaterialPageRoute(
                            builder: (context) => VisualizarUsuario(),
                        ),
                      );
                    },
                    child: Text("Usuários"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(250, 80),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                          MaterialPageRoute(
                            builder: (context) => VisualizarOrganizacao(),
                        ),
                      );
                    },
                    child: Text("Organizações"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(250, 80),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                          MaterialPageRoute(
                            builder: (context) => VisualizarProjetos(),
                        ),
                      );
                    },
                    child: Text("Projetos"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(250, 80),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                          MaterialPageRoute(
                            builder: (context) => VizualizarSobre(),
                        ),
                      );
                    },
                    child: Text("Sobre"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(250, 80),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
