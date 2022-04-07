import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: size.width,
            height: size.height,
            child: FittedBox(
              child: Image.asset("assets/gifs/waves.gif"),
              fit: BoxFit.fill,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
