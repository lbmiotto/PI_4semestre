import 'package:flutter/material.dart';
import 'package:app_flutter/telas/login_page.dart';
import 'package:app_flutter/telas/organizacao_page.dart';
import 'package:app_flutter/telas/perfil_page.dart';
import 'package:app_flutter/telas_adm/painel_adm.dart';
import 'package:app_flutter/telas/sobre_page.dart';
import 'package:app_flutter/telas/inicio_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => PaginaDeLogin(),
        '/organizacao': (context) => OrganizacaoPage(),
        '/perfil': (context) => PaginaPerfil(),
        '/paineladm': (context) => PainelAdm(),
        '/sobre': (context) => SobrePage(),
        '/inicio': (context) => InicioPage(),
      },
    );
  }
}
