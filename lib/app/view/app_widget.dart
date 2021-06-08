import 'package:estudo_flutter_ui_02/app/routes/app_routes.dart';
import 'package:estudo_flutter_ui_02/app/view/create_new_account.dart';
import 'package:estudo_flutter_ui_02/app/view/crud_sqlite_macoratti.dart';
import 'package:estudo_flutter_ui_02/app/view/forgot_password.dart';
import 'package:estudo_flutter_ui_02/app/view/home_page.dart';
import 'package:estudo_flutter_ui_02/app/view/login_page.dart';
import 'package:estudo_flutter_ui_02/app/view/login_page01.dart';
import 'package:estudo_flutter_ui_02/app/view_controller/app_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //fica escutando as alterações re faz rebuild do Widget
    return AnimatedBuilder(
      animation: AppController.getInstancia,
      builder: (context, child) {
        return MaterialApp(
          //tirar selo debug
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            //Aplicar uma condição para alternar thema: Aplicar um if ternario
            brightness: AppController.getInstancia.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          //Definir a rota inicial
          initialRoute: AppRoutes.CRUD_SQLITE_MACORATTI,
          //Definir as rotas nomeadas
          routes: {
            AppRoutes.MAIN: (context) => LoginPage01(),
            AppRoutes.HOME: (context) => HomePage(),
            AppRoutes.LOG_IN: (context) => LoginPage(),
            AppRoutes.LOG_IN01: (context) => LoginPage01(),
            AppRoutes.FORGOT_PASS: (context) => ForgotPassword(),
            AppRoutes.NEW_ACCOUNT: (context) => CreateNewAccount(),
            AppRoutes.CRUD_SQLITE_MACORATTI: (context) => CrudSqliteMacoratti(),
          },
        );
      },
    );
  }
}
