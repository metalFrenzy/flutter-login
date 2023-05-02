import 'package:flutter/material.dart';

class TextFormFieldWrapper extends StatelessWidget {
  final child;

  TextFormFieldWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}
