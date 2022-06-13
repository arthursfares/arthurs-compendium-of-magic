import 'package:arthurs_compendium_of_magic/screens/settings/components/logout_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    TextStyle devCommentStyle = const TextStyle(
        color: Colors.white,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w500);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 100),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            'https://c.tenor.com/ubG2OiW_yT8AAAAC/we-bare-bears.gif',
            width: size.width / 1.2,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 20.0),
        Text('work in progress', style: devCommentStyle),
        Text('here, have a cookie while you wait  🍪', style: devCommentStyle),
        const SizedBox(height: 30.0),
        Container(
          height: 2,
          width: size.width / 1.2,
          color: Colors.black12,
        ),
        const SizedBox(height: 30.0),
        Center(
          child: LogoutButton(
            text: 'Log out',
            press: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ),
      ],
    );
  }
}
