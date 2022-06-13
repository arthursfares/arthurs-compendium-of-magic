import 'package:arthurs_compendium_of_magic/screens/components/already_have_an_account_check.dart';
import 'package:arthurs_compendium_of_magic/screens/components/app_logo.dart';
import 'package:arthurs_compendium_of_magic/screens/components/forgot_password_check.dart';
import 'package:arthurs_compendium_of_magic/screens/components/frosted_glass_panel.dart';
import 'package:arthurs_compendium_of_magic/screens/components/outline_border_input_field.dart';
import 'package:arthurs_compendium_of_magic/screens/components/rounded_gradient_button.dart';
import 'package:arthurs_compendium_of_magic/screens/components/snackbar_messages.dart';
import 'package:arthurs_compendium_of_magic/screens/login/components/login_background.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return LoginBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AppLogo(),
          SizedBox(height: size.height / 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: FrostedGlassPanel(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20.0),
                    OutlineBorderInputField(
                      controller: emailController,
                      labelText: 'E-mail',
                      icon: FontAwesomeIcons.solidChessRook,
                      focusColor: Colors.white,
                    ),
                    OutlineBorderInputField(
                      controller: passwordController,
                      labelText: 'Password',
                      icon: CommunityMaterialIcons.key,
                      focusColor: Colors.white,
                      obscureText: true,
                    ),
                    ForgotPasswordCheck(press: () {}),
                    RoundedGradientButton(
                      text: 'Log in',
                      press: () {
                        login(emailController.text, passwordController.text);
                      },
                    ),
                    AlreadyHaveAnAccountCheck(
                      login: true,
                      press: () {
                        Navigator.pushReplacementNamed(context, 'signup');
                      },
                    ),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // firebase auth login
  Future<void> login(email, password) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
      (res) async {
        Navigator.pushReplacementNamed(context, 'spellcasters');
      },
    ).catchError((e) {
      //print('[error] ' + e.code.toString());
      switch (e.code) {
        case 'invalid-email':
          snackMessage(context, 'Incorrect username or password');
          break;
        case 'wrong-password':
          snackMessage(context, 'Incorrect username or password.');
          break;
        case 'user-not-found':
          snackMessage(context, 'Incorrect username or password.');
          break;
        default:
          snackMessage(context, e.code.toString());
      }
    });
  }
}
