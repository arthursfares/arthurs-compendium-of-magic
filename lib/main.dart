import 'package:arthurs_compendium_of_magic/screens/about/about_screen.dart';
import 'package:arthurs_compendium_of_magic/screens/settings/settings_screen.dart';
import 'package:arthurs_compendium_of_magic/screens/spellbook-add/spellbook_add_screen.dart';
import 'package:arthurs_compendium_of_magic/screens/spellbook/spellbook_screen.dart';
import 'package:arthurs_compendium_of_magic/screens/spellcasters-add/spellcasters_add_screen.dart';
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
        'login':              (context) => const LoginScreen(),
        'signup':             (context) => const SignupScreen(),
        'spellcasters':       (context) => const SpellcastersScreen(),
        'spellcasters-add':   (context) => const SpellcastersAddScreen(),
        'spellbook':          (context) => const SpellbookScreen(),
        'spellbook-add':      (context) => const SpellbookAddScreen(),
        'about':              (context) => const AboutScreen(),
        'settings':           (context) => const SettingsScreen(),
      },
    )
  );
}