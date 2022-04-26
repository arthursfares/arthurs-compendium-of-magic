import 'package:flutter/material.dart';

class OutlineBorderInputField extends StatefulWidget {
  const OutlineBorderInputField({
    Key? key,
    required this.labelText,
    required this.icon,
    this.controller,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  final String labelText;
  final IconData icon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool? obscureText;

  @override
  State<OutlineBorderInputField> createState() =>
      _OutlineBorderInputFieldState();
}

class _OutlineBorderInputFieldState extends State<OutlineBorderInputField> {
  Color _colorText = Colors.white70;

  @override
  Widget build(BuildContext context) {
    const _defaultColor = Colors.white70;
    const _focusColor = Color.fromARGB(212, 146, 84, 200);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Focus(
        onFocusChange: (hasFocus) {
          // When you focus on input email, you need to notify the color change into the widget.
          setState(() => _colorText = hasFocus ? _focusColor : _defaultColor);
        },
        child: TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: widget.obscureText!,
          cursorColor: _colorText,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            prefixIcon: Icon(
              widget.icon,
              color: _colorText,
            ),
            labelText: widget.labelText,
            labelStyle: const TextStyle(color: Colors.white70),
            floatingLabelStyle: TextStyle(
              color: _colorText,
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white70,
                width: 1.2,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(212, 146, 84, 200),
                width: 2.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
