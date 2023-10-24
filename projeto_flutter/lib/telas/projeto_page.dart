import 'package:flutter/material.dart';import 'package:flutter/material.dart';
import 'package:app_flutter/telas/login_page.dart';
import 'package:app_flutter/telas/perfil_page.dart';

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
  final Projeto projeto;

  DetalhesProjetoPage(this.projeto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  "Seu Projeto",
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