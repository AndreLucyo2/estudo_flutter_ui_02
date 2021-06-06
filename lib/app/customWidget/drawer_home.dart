import 'package:estudo_flutter_ui_02/app/customWidget/swtch_theme.dart';
import 'package:estudo_flutter_ui_02/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class DrawerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Andre Lucio da Silva'),
            accountEmail: Text('andre.lucyo2@gmail.com'),
            currentAccountPicture: ClipOval(
              child: Image.asset(
                'assets/images/userAvatar.png',
                fit: BoxFit.cover,
              ),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                child: Text('Als'),
                backgroundColor: Colors.white60,
              ),
              CircleAvatar(
                child: Text('123'),
              ),
            ],
            onDetailsPressed: () {
              print('Detlhes do User.');
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            subtitle: Text('Tela de inicio.'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
              print('Tela home');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            subtitle: Text('Perfil de usuario.'),
            onLongPress: () {
              print('Long ... Tela editar Profile');
            },
            onTap: () {
              print('Tela editar Profile');
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
          Divider(),
          ListTile(
            title: Text('Calls'),
            leading: Icon(Icons.call),
            onLongPress: () {},
          ),
          ListTile(
            title: Text('Support'),
            leading: Icon(
              Icons.report_problem,
              color: Colors.red,
            ),
            onLongPress: () {},
          ),
          ListTile(
            leading: SwtchTheme(),
            title: Text('Config. Tema'),
            subtitle: Text('Tema Dark ou ligth'),
            onTap: () {
              print('Abre a tela configurações');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login01'),
            subtitle: Text('Teste de nova tela'),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.LOG_IN01);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sair'),
            subtitle: Text('Encerrar sessão.'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.MAIN);
            },
          ),
        ],
      ),
    );
  }
}
