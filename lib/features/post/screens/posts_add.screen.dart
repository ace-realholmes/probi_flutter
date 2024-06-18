import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/post_add_body.widget.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/routing/app.router.gr.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PostScreenAdd extends StatefulWidget {
  const PostScreenAdd({super.key});
  @override
  State<PostScreenAdd> createState() => _PostScreenAddState();
}

class _PostScreenAddState extends State<PostScreenAdd> {
  navigateToPostList() {
    context.router.navigate(const PostRouteList());
  }

  navigateToPostDraft() {
    context.router.pushNamed("/post/draft");
  }

  late final postController = Provider.of<PostProvider>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        await postController.storeDraft();
        navigateToPostList();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar(
          leading: BackButton(
            onPressed: () async {
              await postController.storeDraft();

              navigateToPostList();

              postController.toggleTitleError(false);
              postController.toggleBodyError(false);
            },
          ),
          appBarTitle: "Post Add",
          actionWidgets: [
            IconButton(
              onPressed: () {
                navigateToPostDraft();
              },
              icon: const Icon(Icons.drafts),
            )
          ],
        ),
        body: const PostFormAdd(),
      ),
    );
  }
}
