import 'package:flutter/material.dart';
import 'package:app_flutter/telas/organizacao_page.dart';

void main() {
  runApp(DetalhesProjetoPage(Projeto(
    "Nome do Projeto",
    "Descrição do Projeto",
    "Nome da Organização",
    "Endereço do Projeto",
    DateTime.now(),
    DateTime.now(),
    true,
  )));
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
      this.statusLeitura);
}

class DetalhesProjetoPage extends StatelessWidget {
  final Projeto projeto;

  DetalhesProjetoPage(this.projeto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Projeto"),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Nome do Projeto",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  projeto.nome,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  "Descrição",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  projeto.descricao,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  "Organização",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  projeto.organizacao,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  "Endereço de Execução",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  projeto.endereco,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  "Data de Criação",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  projeto.dataCriacao.toString(),
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  "Data de Início",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  projeto.dataInicio.toString(),
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  "Status de Leitura",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  projeto.statusLeitura ? 'Lido' : 'Não lido',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
