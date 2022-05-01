import 'package:arthurs_compendium_of_magic/screens/components/already_have_an_account_check.dart';
import 'package:arthurs_compendium_of_magic/screens/components/app_logo.dart';
import 'package:arthurs_compendium_of_magic/screens/components/forgot_password_check.dart';
import 'package:arthurs_compendium_of_magic/screens/components/frosted_glass_panel.dart';
import 'package:arthurs_compendium_of_magic/screens/components/outline_border_input_field.dart';
import 'package:arthurs_compendium_of_magic/screens/components/rounded_gradient_button.dart';
import 'package:arthurs_compendium_of_magic/screens/login/components/login_background.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                    const OutlineBorderInputField(
                        labelText: 'E-mail', icon: FontAwesomeIcons.solidChessRook, focusColor: Colors.white),
                    const OutlineBorderInputField(
                        labelText: 'Password', icon: CommunityMaterialIcons.key, focusColor: Colors.white, obscureText: true),
                    ForgotPasswordCheck(press: () {
                      // print('forgot password');
                    }),
                    RoundedGradientButton(
                      text: 'Log in',
                      press: () {
                        Navigator.pushReplacementNamed(context, 'spellcasters');
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
}
