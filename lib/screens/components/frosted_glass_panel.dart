import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassPanel extends StatelessWidget {
  const FrostedGlassPanel({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: max(0.001, 20.0),
            sigmaY: max(0.001, 20.0),
          ),
          child: Container(
            // width: size.width * 0.9,
            // height: size.height * 0.60,
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
