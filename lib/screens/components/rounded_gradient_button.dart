import 'package:flutter/material.dart';

class RoundedGradientButton extends StatelessWidget {
  const RoundedGradientButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: press,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80.0),
            ),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xff9254C8), Color(0xffE15FED)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
