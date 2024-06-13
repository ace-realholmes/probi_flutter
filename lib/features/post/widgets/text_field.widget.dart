import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:provider/provider.dart';

class TextFieldBuild extends StatelessWidget {
  TextFieldBuild(
      {super.key,
      required this.maxLines,
      required this.hint,
      required this.controller,
      required this.error});
  final int? maxLines;
  final String hint;
  final TextEditingController controller;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, value, child) {
        return TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            error: error != null ? Text(error!) : null,
          ),
        );
      },
    );
  }
}
