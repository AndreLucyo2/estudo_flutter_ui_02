import 'package:estudo_flutter_ui_02/app/customWidget/pallete.dart';
import 'package:estudo_flutter_ui_02/app/customWidget/password_Input.dart';
import 'package:estudo_flutter_ui_02/app/customWidget/text_Input_field.dart';
import 'package:estudo_flutter_ui_02/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class LoginPage01 extends StatelessWidget {
  //Guarda os valores dos campos
  final String login = '';
  final String senha = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/gradienteBlack.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'Login 01',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Card(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextInputField(
                        icon: Icons.mail,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      PasswordInput(
                        icon: Icons.lock,
                        hint: 'Password',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.done,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(AppRoutes.FORGOT_PASS),
                        child: Text(
                          'Recuperar senha',
                          style: kBodyText,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(

                          //botão estendido até a largura do seu widget pai
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            //Texto alinhado ao centro
                            child: Center(
                              child: Text('Entrar'),
                            ),
                          ),
                          onPressed: () {
                            //---------------------------------------------------
                            //TESTE:
                            Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.HOME);

                            //---------------------------------------------------
                            //Faz a validação do login:
                            if (login.isEmpty && senha.isEmpty) {
                              print(
                                  'Campo login ou senha nao podem ser vazios!');
                              return;
                            }
                            if (login == 'als' ||
                                login == 'als@teste.com' && senha == '123') {
                              print('Parabens voce logou!');
                              //Carrega  tela nomeada:
                              Navigator.of(context)
                                  .pushReplacementNamed(AppRoutes.HOME);
                            } else {
                              print('Senha ou email inválidos!');
                              return;
                            }
                          }),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(AppRoutes.NEW_ACCOUNT),
                child: Container(
                  child: Text(
                    'Criar nova conta',
                    style: kBodyText,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
