import 'package:flutter/material.dart';

class OutlineBorderPasswordField extends StatelessWidget {
  const OutlineBorderPasswordField({
    Key? key,
    required this.labelText,
    required this.icon,
  }) : super(key: key);

  final String labelText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Theme(
        data: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: const Color.fromARGB(212, 146, 84, 200),
              ),
        ),
        child: TextField(
          obscureText: false,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
            prefixIcon: Icon(
              icon,
              color: Colors.blueGrey,
            ),
            suffixIcon: const Icon(
              Icons.visibility,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
