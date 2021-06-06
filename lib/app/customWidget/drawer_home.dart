import 'package:estudo_flutter_ui_02/app/customWidget/swtch_theme.dart';
import 'package:flutter/material.dart';

class DrawerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: ClipOval(
                child: Image.asset(
                  'assets/images/userAvatar.png',
                  fit: BoxFit.cover,
                ),
              ),
              accountName: Text('Andre Lucio da Silva'),
              accountEmail: Text('andre.lucyo2@gmail.com')),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            subtitle: Text('Tela de inicio.'),
            onTap: () {
              print('Tela home');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sair'),
            subtitle: Text('Encerrar sessão.'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            subtitle: Text('Tela de configurações.'),
            onTap: () {
              print('Abre a tela configurações');
            },
          ),
          ListTile(
            leading: SwtchTheme(),
            title: Text('Config. Tema'),
            subtitle: Text('Tema Dark ou ligth'),
            onTap: () {
              print('Abre a tela configurações');
            },
          ),
        ],
      ),
    );
  }
}
