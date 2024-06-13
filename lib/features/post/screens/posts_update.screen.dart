import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/features/post/widgets/post_update_body.widget.dart';
import 'package:probi_flutter/routing/app.router.gr.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PostScreenUpdate extends StatefulWidget {
  const PostScreenUpdate({super.key, required this.id});
  final int id;

  @override
  State<PostScreenUpdate> createState() => _PostScreenUpdateState();
}

class _PostScreenUpdateState extends State<PostScreenUpdate> {
  late var navigateToPostList = context.router.navigate(const PostRouteList());

  @override
  Widget build(BuildContext context) {
   final postController = Provider.of<PostProvider>(context);
    return PopScope(
      onPopInvoked: (didPop) async => await postController.storeDraft(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: buildAppBar(
              leading: BackButton(
                onPressed: () async {
                  await postController.storeDraft();
                  navigateToPostList;

                  postController.toggleTitleError(false);
                  postController.toggleBodyError(false);
                },
              ),
              appBarTitle: "Post Update",
              actionWidgets: [
                IconButton(
                    onPressed: () {
                      context.router.pushNamed("/post/draft");
                    },
                    icon: const Icon(Icons.drafts))
              ]),
          body: PostUpdateBody(id: widget.id)),
    );
  }
}
