import 'package:flutter/material.dart';
import 'package:app_flutter/telas/login_page.dart';
import 'package:app_flutter/telas/inicio_page.dart';
import 'package:app_flutter/telas/organizacao_page.dart';
import 'package:app_flutter/telas/sobre_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaginaPerfil(),
    );
  }
}

class PaginaPerfil extends StatelessWidget {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              // backgroundImage: AssetImage('caminho_da_sua_imagem.png'),
            ),
            SizedBox(height: 16),
            Text(
              'Seu Nome',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'seu.email@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 600,
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 600,
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 600,
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Celular'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 600,
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Endereço'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 600,
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Nível de Acesso'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
