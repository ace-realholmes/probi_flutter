import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:provider/provider.dart';

class TextFieldBuild extends StatefulWidget {
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
  State<TextFieldBuild> createState() => _TextFieldBuildState();
}

class _TextFieldBuildState extends State<TextFieldBuild> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, value, child) {
        return TextField(
          controller: widget.controller,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            hintText: widget.hint,
            filled: true,
            error: widget.error != null ? Text(widget.error!) : null,
          ),
        );
      },
    );
  }
}
