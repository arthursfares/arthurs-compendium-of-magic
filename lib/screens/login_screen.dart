import 'dart:ui';

import 'package:arthurs_compendium_of_magic/screens/components/already_have_an_account_check.dart';
import 'package:arthurs_compendium_of_magic/screens/components/forgot_password_check.dart';
import 'package:arthurs_compendium_of_magic/screens/components/outline_border_input_field.dart';
import 'package:arthurs_compendium_of_magic/screens/components/outline_border_password_field.dart';
import 'package:arthurs_compendium_of_magic/screens/components/rounded_gradient_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: size.width,
            height: size.height,
            child: FittedBox(
              child: Image.asset("assets/gifs/waves.gif"),
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 60.0, right: 60.0, top: 80.0, bottom: 60.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  child: const Text(
                    'Arthur\'s Compendium of Magic',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              Center(
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                    child: Container(
                      width: size.width * 0.9,
                      // height: size.height * 0.45,
                      height: size.height * 0.63,
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
                            const OutlineBorderPasswordField(
                                labelText: 'Password', icon: Icons.lock),
                            ForgotPasswordCheck(press: (){
                              // print('forgot password');
                            }),
                            const RoundedGradientButton(text: 'Log in'),
                            AlreadyHaveAnAccountCheck(
                                login: true,
                                press: () {
                                  // print('sign up');
                                  Navigator.pushNamed(context, 'signup');
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
