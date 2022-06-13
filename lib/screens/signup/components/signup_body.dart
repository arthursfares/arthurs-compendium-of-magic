import 'package:arthurs_compendium_of_magic/models/user_model.dart';
import 'package:arthurs_compendium_of_magic/screens/components/already_have_an_account_check.dart';
import 'package:arthurs_compendium_of_magic/screens/components/app_logo.dart';
import 'package:arthurs_compendium_of_magic/screens/components/frosted_glass_panel.dart';
import 'package:arthurs_compendium_of_magic/screens/components/outline_border_input_field.dart';
import 'package:arthurs_compendium_of_magic/screens/components/rounded_gradient_button.dart';
import 'package:arthurs_compendium_of_magic/screens/components/snackbar_messages.dart';
import 'package:arthurs_compendium_of_magic/screens/signup/components/signup_background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({Key? key}) : super(key: key);

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SignupBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AppLogo(),
          SizedBox(height: size.height / 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: FrostedGlassPanel(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20.0),
                    OutlineBorderInputField(
                      controller: usernameController,
                      labelText: 'Username',
                      icon: FontAwesomeIcons.cat,
                      focusColor: Colors.white,
                    ),
                    OutlineBorderInputField(
                      controller: emailController,
                      labelText: 'E-mail',
                      icon: FontAwesomeIcons.solidChessRook,
                      focusColor: Colors.white,
                    ),
                    OutlineBorderInputField(
                      controller: passwordController,
                      labelText: 'Password',
                      icon: CommunityMaterialIcons.key,
                      obscureText: true,
                      focusColor: Colors.white,
                    ),
                    RoundedGradientButton(
                      text: 'Sign up',
                      press: () {
                        signup(
                          usernameController.text,
                          emailController.text,
                          passwordController.text,
                        );
                      },
                    ),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                    ),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // firebase auth signup
  void signup(username, email, password) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((res) {
      // add user to database
      FirebaseFirestore.instance.collection('users').add(
        UserModel(res.user!.uid.toString(), username).toJson(),
      );
      // snackbar welcome message
      snackMessage(context, 'Welcome, $username  📚💀🔮');
      // go to login page
      Navigator.pushReplacementNamed(context, 'login');
    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          snackMessage(context, 'Invalid email.');
          break;
        case 'invalid-email':
          snackMessage(context, 'Invalid email.');
          break;
        default:
          snackMessage(context, e.code.toString());
      }
    });
  }
}
