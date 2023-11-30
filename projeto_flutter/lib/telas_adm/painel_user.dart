import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VisualizarUsuario(),
    );
  }
}

class VisualizarUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter-Django Exemplo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CadastrarUsuarioPage()),
                );
              },
              child: Text('Cadastrar Usuário'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeletarUsuarioPage()),
                );
              },
              child: Text('Deletar Usuário'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AtualizarUsuarioPage()),
                );
              },
              child: Text('Atualizar Usuário'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ObterUsuarioPage()),
                );
              },
              child: Text('Obter Usuário'),
            ),
          ],
        ),
      ),
    );
  }
}

// CADASTRAR USER NA TABELA
class CadastrarUsuarioPage extends StatefulWidget {
  @override
  _CadastrarUsuarioPageState createState() => _CadastrarUsuarioPageState();
}

class _CadastrarUsuarioPageState extends State<CadastrarUsuarioPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> cadastrarUsuario() async {
    String url = "http://localhost:8000/signup/";

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": usernameController.text,
          "password": passwordController.text,
        }),
      );

      if (response.statusCode == 201) {
        print("Usuário cadastrado com sucesso!");
        Navigator.pop(context);
      } else {
        print(
            "Erro ao cadastrar usuário. Código de status: ${response.statusCode}");
      }
    } catch (error) {
      print("Erro na solicitação HTTP: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: "Nome de Usuário"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Senha"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: cadastrarUsuario,
              child: Text('Cadastrar Agora'),
            ),
          ],
        ),
      ),
    );
  }
}

// DELETAR USER DA TABELA
class DeletarUsuarioPage extends StatefulWidget {
  @override
  _DeletarUsuarioPageState createState() => _DeletarUsuarioPageState();
}

class _DeletarUsuarioPageState extends State<DeletarUsuarioPage> {
  final TextEditingController userNameController = TextEditingController();

  Future<void> deletarUsuario() async {
    String url = "http://localhost:8000/delete/";

    try {
      var response = await http.delete(
        Uri.parse("$url${userNameController.text}/"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 204) {
        print("Usuário deletado com sucesso!");
        Navigator.pop(context);
      } else {
        print(
            "Erro ao deletar usuário. Código de status: ${response.statusCode}");
      }
    } catch (error) {
      print("Erro na solicitação HTTP: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deletar Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: userNameController,
              decoration:
                  InputDecoration(labelText: "Nome do Usuário a Deletar"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: deletarUsuario,
              child: Text('Deletar Agora'),
            ),
          ],
        ),
      ),
    );
  }
}

// UPDATE USER DA TABELA
class AtualizarUsuarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Obter Usuário'),
      ),
      body: Center(
        child: Text('Página de Obter Usuário'),
      ),
    );
  }
}

// READ USER DA TABELA
class ObterUsuarioPage extends StatefulWidget {
  @override
  _ObterUsuarioPageState createState() => _ObterUsuarioPageState();
}

class _ObterUsuarioPageState extends State<ObterUsuarioPage> {
  List<Map<String, dynamic>> usuarios = [];

  Future<void> obterUsuarios() async {
    String url = "http://localhost:8000/read/";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );

      if (mounted) {
        setState(() {
          if (response.statusCode == 200) {
            // Atualizar a lista de usuários
            usuarios =
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
    obterUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Obter Usuários'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: obterUsuarios,
              child: Text('Obter Usuários'),
            ),
            SizedBox(height: 20),
            Text('Lista de Usuários:'),
            Expanded(
              child: ListView.builder(
                itemCount: usuarios.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'ID: ${usuarios[index]['id']}           |            Username: ${usuarios[index]['username']}',
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
