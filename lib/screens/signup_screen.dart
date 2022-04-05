import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.symmetric(
                    horizontal: 60.0, vertical: 80.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  child: const Text(
                    'Arthur\'s Compendium of Magic',
                    textAlign: TextAlign.center,
                    // TODO: change title font family
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
                      height: size.height * 0.60,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // TODO: change TextField colors
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Theme(
                                data: ThemeData(
                                  //).copyWith(
                                  colorScheme: ThemeData().colorScheme.copyWith(
                                        primary: const Color.fromARGB(
                                            212, 146, 84, 200),
                                      ),
                                ),
                                child: const TextField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Username',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Theme(
                                data: ThemeData(
                                  //).copyWith(
                                  colorScheme: ThemeData().colorScheme.copyWith(
                                        primary: const Color.fromARGB(
                                            212, 146, 84, 200),
                                      ),
                                ),
                                child: const TextField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'E-mail',
                                  ),
                                ),
                              ),
                            ),
                            // TODO: change TextField colors
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Theme(
                                data: ThemeData().copyWith(
                                  colorScheme: ThemeData().colorScheme.copyWith(
                                        primary: const Color.fromARGB(
                                            212, 146, 84, 200),
                                      ),
                                ),
                                child: const TextField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Theme(
                                data: ThemeData().copyWith(
                                  colorScheme: ThemeData().colorScheme.copyWith(
                                        primary: const Color.fromARGB(
                                            212, 146, 84, 200),
                                      ),
                                ),
                                child: const TextField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Confirm password',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50.0,
                              margin: const EdgeInsets.all(10),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.zero),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                  ),
                                ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xff9254C8),
                                          Color(0xffE15FED)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 250.0, minHeight: 50.0),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "Sign up",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Already have an account? ',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Log in',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print('login');
                                          Navigator.pushNamed(context, 'login');
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
