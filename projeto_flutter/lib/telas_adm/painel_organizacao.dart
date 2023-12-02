import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(VisualizarOrganizacao());
}

class Organizacao {
  final String nome;

  Organizacao(this.nome);
}

class VisualizarOrganizacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Painel de Administração de Organizações'),
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
                        builder: (context) => CadastrarOrganizacaoPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 36),
                ),
                child: Text('Cadastrar Organização'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeletarOrganizacaoPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 36),
                ),
                child: Text('Deletar Organização'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ObterOrganizacaoPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 36),
                ),
                child: Text('Obter Organização'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CADASTRAR GROUP NA TABELA
class CadastrarOrganizacaoPage extends StatefulWidget {
  @override
  _CadastrarOrganizacaoPageState createState() => _CadastrarOrganizacaoPageState();
}

class _CadastrarOrganizacaoPageState extends State<CadastrarOrganizacaoPage> {
  final TextEditingController nameController = TextEditingController();

  Future<void> cadastrarOrganizacao() async {
    String url = "http://localhost:8000/group/";

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": nameController.text,
        }),
      );

      if (response.statusCode == 201) {
        print("Organização cadastrada com sucesso!");
        Navigator.pop(context);
      } else {
        print(
            "Erro ao cadastrar Organização. Código de status: ${response.statusCode}");
      }
    } catch (error) {
      print("Erro na solicitação HTTP: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Organização'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Nome da Organização"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: cadastrarOrganizacao,
              child: Text('Cadastrar Agora'),
            ),
          ],
        ),
      ),
    );
  }
}

// DELETAR GROUP DA TABELA
class DeletarOrganizacaoPage extends StatefulWidget {
  @override
  _DeletarOrganizacaoPageState createState() => _DeletarOrganizacaoPageState();
}

class _DeletarOrganizacaoPageState extends State<DeletarOrganizacaoPage> {
  final TextEditingController OrganizacaoNameController = TextEditingController();

  Future<void> deletarOrganizacao() async {
    String url = "http://localhost:8000/delete_group/";

    try {
      var response = await http.delete(
        Uri.parse("$url${OrganizacaoNameController.text}/"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 204) {
        print("Organização deletada com sucesso!");
        Navigator.pop(context);
      } else {
        print(
            "Erro ao deletar Organização. Código de status: ${response.statusCode}");
      }
    } catch (error) {
      print("Erro na solicitação HTTP: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deletar Organização'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: OrganizacaoNameController,
              decoration:
                  InputDecoration(labelText: "Nome da Organização a Deletar"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: deletarOrganizacao,
              child: Text('Deletar Agora'),
            ),
          ],
        ),
      ),
    );
  }
}

// READ GROUP DA TABELA
class ObterOrganizacaoPage extends StatefulWidget {
  @override
  _ObterOrganizacaoPageState createState() => _ObterOrganizacaoPageState();
}

class _ObterOrganizacaoPageState extends State<ObterOrganizacaoPage> {
  List<Map<String, dynamic>> grupos = [];

  Future<void> obterOrganizacao() async {
    String url = "http://localhost:8000/read_group/";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );

      if (mounted) {
        setState(() {
          if (response.statusCode == 200) {
            grupos =
                List<Map<String, dynamic>>.from(json.decode(response.body));
          } else {
            print(
                "Erro ao obter Organizações. Código de status: ${response.statusCode}");
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
    obterOrganizacao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Obter Organizações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: obterOrganizacao,
              child: Text('Obter Organizações'),
            ),
            SizedBox(height: 20),
            Text('Lista de Organizações:'),
            Expanded(
              child: ListView.builder(
                itemCount: grupos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'ID: ${grupos[index]['id']}           |            Name: ${grupos[index]['name']}',
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