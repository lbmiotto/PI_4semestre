import 'package:flutter/material.dart';
import 'package:app_flutter/telas/login_page.dart';
import 'package:app_flutter/telas/organizacao_page.dart';
import 'package:app_flutter/telas/perfil_page.dart';
import 'package:app_flutter/telas/painel_adm.dart';
import 'package:app_flutter/telas/sobre_page.dart';
import 'package:app_flutter/telas/teste.dart';

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
        '/paineladm': (context) => PanelAdm(),
        '/sobre': (context) => SobrePage(),
        '/teste': (context) => TelasTeste(),
      },
    );
  }
}
