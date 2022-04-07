import 'package:arthurs_compendium_of_magic/screens/components/already_have_an_account_check.dart';
import 'package:arthurs_compendium_of_magic/screens/components/app_logo.dart';
import 'package:arthurs_compendium_of_magic/screens/components/frosted_glass_panel.dart';
import 'package:arthurs_compendium_of_magic/screens/components/outline_border_input_field.dart';
import 'package:arthurs_compendium_of_magic/screens/components/outline_border_password_field.dart';
import 'package:arthurs_compendium_of_magic/screens/components/rounded_gradient_button.dart';
import 'package:arthurs_compendium_of_magic/screens/signup/components/signup_background.dart';
import 'package:flutter/material.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignupBackground(
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
                const OutlineBorderInputField(
                    labelText: 'E-mail', icon: Icons.mail),
                const OutlineBorderPasswordField(
                    labelText: 'Password', icon: Icons.lock),
                RoundedGradientButton(
                  text: 'Sign up',
                  press: () {},
                ),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Navigator.pushReplacementNamed(context, 'login');
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
