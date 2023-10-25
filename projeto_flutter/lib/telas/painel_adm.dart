import 'package:flutter/material.dart';
import 'package:app_flutter/telas/login_page.dart';
import 'package:app_flutter/telas/perfil_page.dart';
import 'package:app_flutter/telas/painel_user.dart';
import 'package:app_flutter/telas/painel_organizacao.dart';
import 'package:app_flutter/telas/painel_projetos.dart';

void main() {
  runApp(MinhaApp());
}

class MinhaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PanelAdm(),
    );
  }
}

class PanelAdm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  "Administrador",
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
          
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

              Expanded(
              child: Column(
              children: <Widget>[
                  SizedBox(height: 50),
                    Container(
                      width: 700,
                      height: 400,
                      margin: EdgeInsets.only(left: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.black, // Cor da borda
                            width: 2.0, // Largura da borda
                          ),
                      ),
                      child: Center(
                        child: Text(
                          "aaaaaaaaaaaaaaaaaa",
                          style: TextStyle(fontSize: 24),
                        ),
                ),
              ),
              
                
            ],
            ),
              ),


            Expanded(
              
              child: Column(
                children: <Widget>[
                  SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VisualizarUsuario()));
                    },
                    child: Container(
                      
                      width: 350,
                      height: 100,
                      child: Center(
                        child: Text(
                          "Visualizar Usuário",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VisualizarOrganizacao()));
                    },
                    child: Container(
                      width: 350,
                      height: 100,
                      child: Center(
                        child: Text(
                          "Visualizar Organização",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VisualizarProjetos()));
                    },
                    child: Container(
                      width: 350,
                      height: 100,
                      child: Center(
                        child: Text(
                          "Visualizar Projetos",
                          style: TextStyle(fontSize: 24),
                        ),
                ),
              ),
            ),
            ],
            ),
            ),
          ],
        ),
      );
  }
}