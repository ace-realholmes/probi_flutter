import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/features/post/widgets/post_view_body.widget.dart';
import 'package:probi_flutter/routing/app.router.gr.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PostScreenView extends StatefulWidget {
  final int id;
  final int index;
  const PostScreenView({super.key, required this.id, required this.index});

  @override
  State<PostScreenView> createState() => _PostScreenViewState();
}

class _PostScreenViewState extends State<PostScreenView> {
  late final postController = Provider.of<PostProvider>(context);
  late var navigatePostList = context.router.navigate(const PostRouteList());
  late var navigatePostUpdate =
      context.router.navigate(PostRouteUpdate(id: widget.id));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
          leading: IconButton(
              onPressed: () {
                context.router.back();
              },
              icon: const Icon(Icons.arrow_back)),
          appBarTitle: 'Post View',
        ),
        body: PostViewBody(id: widget.id, index: widget.index));
  }
}
