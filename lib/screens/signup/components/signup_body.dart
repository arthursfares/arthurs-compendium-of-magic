import 'package:arthurs_compendium_of_magic/screens/components/already_have_an_account_check.dart';
import 'package:arthurs_compendium_of_magic/screens/components/app_logo.dart';
import 'package:arthurs_compendium_of_magic/screens/components/frosted_glass_panel.dart';
import 'package:arthurs_compendium_of_magic/screens/components/outline_border_input_field.dart';
import 'package:arthurs_compendium_of_magic/screens/components/rounded_gradient_button.dart';
import 'package:arthurs_compendium_of_magic/screens/signup/components/signup_background.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SignupBackground(
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
                        labelText: 'Username', icon: FontAwesomeIcons.cat, focusColor: Colors.white),
                    const OutlineBorderInputField(
                        labelText: 'E-mail', icon: FontAwesomeIcons.solidChessRook, focusColor: Colors.white),
                    const OutlineBorderInputField(
                        labelText: 'Password', icon: CommunityMaterialIcons.key, obscureText: true, focusColor: Colors.white),
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
