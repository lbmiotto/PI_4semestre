import 'package:flutter/material.dart';
import 'package:app_flutter/telas/login_page.dart';
import 'package:app_flutter/telas/organizacao_page.dart';
import 'package:app_flutter/telas/perfil_page.dart';
import 'package:app_flutter/telas/painel_adm.dart';

void main() {
  runApp(MinhaApp());
}

class MinhaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => PaginaDeLogin(),
        '/organizacao': (context) => OrganizacaoPage(),
        '/perfil': (context) => PaginaPerfil(),
        '/paineladm': (context) => PanelAdm(),
      },
    );
  }
}
