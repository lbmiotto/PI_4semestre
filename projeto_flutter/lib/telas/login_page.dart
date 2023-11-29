import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_flutter/telas/inicio_page.dart';
import 'package:app_flutter/telas_adm/painel_adm.dart';

void main() {
  runApp(PaginaDeLogin());
}

class PaginaDeLogin extends StatefulWidget {
  @override
  _EstadoPaginaDeLogin createState() => _EstadoPaginaDeLogin();
}

class _EstadoPaginaDeLogin extends State<PaginaDeLogin> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  bool _senhaVisivel = false;

  void processarLogin() async {
    String login = loginController.text;
    String senha = senhaController.text;

    // URL do endpoint Django para verificar login e senha
    String url = "http://localhost:8000/login/";

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": login, "password": senha}),
      );

      // Verifica se a solicitação foi bem-sucedida (código de status 200)
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        bool isSuperuser = responseData['is_superuser'];

        print("Login bem-sucedido!");

        // Redireciona com base no valor de is_superuser
        if (isSuperuser) {
          // Redireciona para a página PainelAdm
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PainelAdm()),
          );
        } else {
          // Redireciona para a página InicioPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InicioPage()),
          );
        }
      } else if (response.statusCode == 401) {
        print("Combinação de login e senha inválida.");
      } else {
        print(
            "Erro ao processar login. Código de status: ${response.statusCode}");
      }
    } catch (error) {
      print("Erro na solicitação HTTP: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            width: 400.0,
            height: 600.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 247, 242, 242),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 3),
                  blurRadius: 6.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 0, top: 0),
                  child: Image.asset(
                    'assets/img/logotipo_6ddrones.png',
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30.0, top: 0.0),
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    height: 50.0,
                    width: 300.0,
                    child: TextFormField(
                      key: Key('loginField'),
                      controller: loginController,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30.0, top: 0.0),
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    height: 60.0,
                    width: 300.0,
                    child: TextFormField(
                      key: Key('senhaField'),
                      controller: senhaController,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _senhaVisivel
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _senhaVisivel = !_senhaVisivel;
                            });
                          },
                        ),
                      ),
                      obscureText: !_senhaVisivel,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: processarLogin,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                TextButton(
                  onPressed: () {
                    // Coloque aqui o código a ser executado quando o texto for clicado
                  },
                  child: Text(
                    'Entrar como usuário anônimo para teste',
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
