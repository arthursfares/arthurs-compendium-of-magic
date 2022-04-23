import 'package:flutter/material.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Log out'),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'login');
        },
      ),
    );
  }
}