import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class PostScreenAdd extends StatefulWidget {
  const PostScreenAdd({super.key});

  @override
  State<PostScreenAdd> createState() => _PostScreenAddState();
}

class _PostScreenAddState extends State<PostScreenAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Post Screen Add'),
      ),
    );
  }
}