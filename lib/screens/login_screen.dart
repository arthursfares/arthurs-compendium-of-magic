import 'dart:ui';

import 'package:arthurs_compendium_of_magic/screens/components/outline_border_input_field.dart';
import 'package:arthurs_compendium_of_magic/screens/components/outline_border_password_field.dart';
import 'package:arthurs_compendium_of_magic/screens/components/rounded_gradient_button.dart';
import 'package:flutter/gestures.dart';
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
                            const OutlineBorderInputField(labelText: 'Username', icon: Icons.person),
                            const OutlineBorderPasswordField(labelText: 'Password', icon: Icons.lock),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Forgot your password?',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // print('forgot password');
                                    },
                                  style: const TextStyle(
                                      color: Color.fromARGB(212, 146, 84, 200)),
                                ),
                              ),
                            ),
                            const RoundedGradientButton(text: 'Log in'),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Don\'t have an account? ',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Sign up',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // print('sign up');
                                          Navigator.pushNamed(
                                              context, 'signup');
                                        },
                                      style: const TextStyle(
                                          color: Color(0xffE15FED)),
                                    ),
                                  ],
                                ),
                              ),
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
        ],
      ),
    );
  }
}
