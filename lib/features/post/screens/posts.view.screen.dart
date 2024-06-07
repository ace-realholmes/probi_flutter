import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class PostScreenView extends StatefulWidget {
  const PostScreenView({super.key});

  @override
  State<PostScreenView> createState() => _PostScreenViewState();
}

class _PostScreenViewState extends State<PostScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Post Screen View'),
      ),
    );
  }
}