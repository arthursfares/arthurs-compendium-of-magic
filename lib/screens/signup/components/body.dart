import 'dart:ui';

import 'package:arthurs_compendium_of_magic/screens/components/already_have_an_account_check.dart';
import 'package:arthurs_compendium_of_magic/screens/components/app_logo.dart';
import 'package:arthurs_compendium_of_magic/screens/components/outline_border_input_field.dart';
import 'package:arthurs_compendium_of_magic/screens/components/outline_border_password_field.dart';
import 'package:arthurs_compendium_of_magic/screens/components/rounded_gradient_button.dart';
import 'package:arthurs_compendium_of_magic/screens/signup/components/background.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AppLogo(),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const OutlineBorderInputField(
                            labelText: 'Username', icon: Icons.person),
                        const OutlineBorderInputField(
                            labelText: 'E-mail', icon: Icons.mail),
                        const OutlineBorderPasswordField(
                            labelText: 'Password', icon: Icons.lock),
                        const RoundedGradientButton(text: 'Sign up'),
                        AlreadyHaveAnAccountCheck(
                          login: false,
                          press: () {
                            // print('login');
                            Navigator.pushNamed(context, 'login');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
