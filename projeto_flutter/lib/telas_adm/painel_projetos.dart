import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(VisualizarProjetos());
}

class projeto {
  final String nome;

  projeto(this.nome);
}

class VisualizarProjetos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Painel de Administração de Usuários'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CadastrarProjetoPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 36),
                ),
                child: Text('Cadastrar Projeto'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeletarProjetoPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 36),
                ),
                child: Text('Deletar Projeto'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ObterProjetoPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 36),
                ),
                child: Text('Obter Projetos'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CADASTRAR PROJETO NA TABELA
class CadastrarProjetoPage extends StatefulWidget {
  @override
  _CadastrarProjetoPageState createState() => _CadastrarProjetoPageState();
}

class _CadastrarProjetoPageState extends State<CadastrarProjetoPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  Future<void> cadastrarProjeto() async {
    String url = "http://localhost:8000/project/";

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": nameController.text,
          "desc": descController.text,
        }),
      );

      if (response.statusCode == 201) {
        print("Projeto cadastrado com sucesso!");
        Navigator.pop(context);
      } else {
        print(
            "Erro ao cadastrar Projeto. Código de status: ${response.statusCode}");
      }
    } catch (error) {
      print("Erro na solicitação HTTP: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Projeto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Nome do Projeto"),
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(labelText: "Descrição"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: cadastrarProjeto,
              child: Text('Cadastrar Agora'),
            ),
          ],
        ),
      ),
    );
  }
}

// DELETAR PROJETO DA TABELA
class DeletarProjetoPage extends StatefulWidget {
  @override
  _DeletarProjetoPageState createState() => _DeletarProjetoPageState();
}

class _DeletarProjetoPageState extends State<DeletarProjetoPage> {
  final TextEditingController nameController = TextEditingController();

  Future<void> deletarProjeto() async {
    String url = "http://localhost:8000/delete_project/";

    try {
      var response = await http.delete(
        Uri.parse("$url${nameController.text}/"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 204) {
        print("Projeto deletado com sucesso!");
        Navigator.pop(context);
      } else {
        print(
            "Erro ao deletar Projeto. Código de status: ${response.statusCode}");
      }
    } catch (error) {
      print("Erro na solicitação HTTP: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deletar Projeto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration:
                  InputDecoration(labelText: "Nome do Projeto a Deletar"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: deletarProjeto,
              child: Text('Deletar Agora'),
            ),
          ],
        ),
      ),
    );
  }
}

// READ USER DA TABELA
class ObterProjetoPage extends StatefulWidget {
  @override
  _ObterProjetoPageState createState() => _ObterProjetoPageState();
}

class _ObterProjetoPageState extends State<ObterProjetoPage> {
  List<Map<String, dynamic>> projetos = [];

  Future<void> obterProjetos() async {
    String url = "http://localhost:8000/read_project/";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );

      if (mounted) {
        setState(() {
          if (response.statusCode == 200) {
            projetos =
                List<Map<String, dynamic>>.from(json.decode(response.body));
          } else {
            print(
                "Erro ao obter usuários. Código de status: ${response.statusCode}");
          }
        });
      }
    } catch (error) {
      print("Erro na solicitação HTTP: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    obterProjetos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Obter Projetos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: obterProjetos,
              child: Text('Obter Projetos'),
            ),
            SizedBox(height: 20),
            Text('Lista de Projetos:'),
            Expanded(
              child: ListView.builder(
                itemCount: projetos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'ID: ${projetos[index]['id']}           |            Name: ${projetos[index]['name']}          |          Descrição: ${projetos[index]['desc']}',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}