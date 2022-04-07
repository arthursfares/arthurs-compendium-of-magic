import 'package:flutter/material.dart';

class ForgotPasswordCheck extends StatelessWidget {
  const ForgotPasswordCheck({
    Key? key,
    required this.press,
  }) : super(key: key);

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: press,
        child: const Text(
          'Forgot your password?',
          style: TextStyle(
            color: Color(0xffE15FED),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
