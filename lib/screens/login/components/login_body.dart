import 'package:arthurs_compendium_of_magic/screens/components/already_have_an_account_check.dart';
import 'package:arthurs_compendium_of_magic/screens/components/app_logo.dart';
import 'package:arthurs_compendium_of_magic/screens/components/forgot_password_check.dart';
import 'package:arthurs_compendium_of_magic/screens/components/frosted_glass_panel.dart';
import 'package:arthurs_compendium_of_magic/screens/components/outline_border_input_field.dart';
import 'package:arthurs_compendium_of_magic/screens/components/outline_border_password_field.dart';
import 'package:arthurs_compendium_of_magic/screens/components/rounded_gradient_button.dart';
import 'package:arthurs_compendium_of_magic/screens/login/components/login_background.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AppLogo(),
          FrostedGlassPanel(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const OutlineBorderInputField(
                    labelText: 'Username', icon: Icons.person),
                const OutlineBorderPasswordField(
                    labelText: 'Password', icon: Icons.lock),
                ForgotPasswordCheck(press: () {
                  // print('forgot password');
                }),
                RoundedGradientButton(
                  text: 'Log in',
                  press: () {
                    Navigator.pushReplacementNamed(context, 'home');
                  },
                ),
                AlreadyHaveAnAccountCheck(
                  login: true,
                  press: () {
                    Navigator.pushReplacementNamed(context, 'signup');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
