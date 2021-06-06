import 'dart:ui';
import 'package:estudo_flutter_ui_02/app/customWidget/pallete.dart';
import 'package:estudo_flutter_ui_02/app/customWidget/password_Input.dart';
import 'package:estudo_flutter_ui_02/app/customWidget/text_Input_field.dart';
import 'package:estudo_flutter_ui_02/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class CreateNewAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400]!.withOpacity(
                              0.4,
                            ),
                            //Avatar de login:
                            child: Icon(
                              Icons.person,
                              color: kWhite,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: kBlue,
                          shape: BoxShape.circle,
                          border: Border.all(color: kWhite, width: 2),
                        ),
                        //Selecionar Foto:
                        child: Icon(
                          Icons.settings,
                          color: kWhite,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
                    TextInputField(
                      icon: Icons.person,
                      hint: 'User',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
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
                      inputAction: TextInputAction.next,
                    ),
                    PasswordInput(
                      icon: Icons.lock,
                      hint: 'Confirm Password',
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('Register')),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ja possui conta?',
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.LOG_IN01);
                          },
                          child: Text(
                            'Login',
                            style: kBodyText.copyWith(
                                color: kBlue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
