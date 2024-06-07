import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class PostScreenUpdate extends StatefulWidget {
  const PostScreenUpdate({super.key});

  @override
  State<PostScreenUpdate> createState() => _PostScreenUpdateState();
}

class _PostScreenUpdateState extends State<PostScreenUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Post Screen Update'),
      ),
    );
  }
}