import 'package:arthurs_compendium_of_magic/screens/signup/components/signup_body.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignupBody()
    );
  }
}
