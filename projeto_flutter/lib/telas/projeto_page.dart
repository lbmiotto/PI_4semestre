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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Projeto meuProjeto =
        Projeto(nome: "6DDrones", descricao: "Lorem Lorem Lorem Lorem Lorem");
    return MaterialApp(
      home: DetalhesProjetoPage(meuProjeto),
    );
  }
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
        title: Text('Detalhes do Projeto'),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(200.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildDetalheItem(Icons.person, 'Nome:', '6DDrones', 28),
              _buildDetalheItem(
                Icons.description,
                'Descrição:',
                'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
                18,
              ),
              _buildDetalheItem(
                  Icons.calendar_today, 'Data de Inicio:', '[Data de Início do Projeto]', 18),
              _buildDetalheItem(Icons.calendar_today, 'Data de Fim:', 'null', 18),
              _buildDetalheItem(Icons.check, 'Finalizado:', 'Não', 18),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  obterLinkDoMapa(5);
                },
                child: Text("Ver Mapa"),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
Widget _buildDetalheItem(IconData icon, String label, String value, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 36,
            color: Colors.blue, // Altere a cor conforme necessário
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
