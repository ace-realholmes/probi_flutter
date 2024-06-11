import 'package:flutter/material.dart';

class TextFieldBuild extends StatelessWidget {
  const TextFieldBuild(
      {super.key,
      required this.maxLines,
      required this.hint,
      required this.controller});
  final int? maxLines;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(hintText: hint,
        filled: true,
        fillColor: const Color.fromARGB(255, 252, 239, 239))
        );
  }
}
