import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginScreen(),
      },
    )
  );
}