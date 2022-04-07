import 'package:arthurs_compendium_of_magic/screens/spellcasters/spellcasters_screen.dart';
import 'package:arthurs_compendium_of_magic/screens/login/login_screen.dart';
import 'package:arthurs_compendium_of_magic/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginScreen(),
        'signup': (context) => const SignupScreen(),
        'spellcasters': (context) => const SpellcastersScreen(),
      },
    )
  );
}