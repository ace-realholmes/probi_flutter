import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:logger/logger.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/features/post/widgets/text_field.widget.dart';
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
  late final postController = Provider.of<PostProvider>(context);
  late var navigatePostList = context.router.navigate(const PostRouteList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
            leading: BackButton(
              onPressed: () async {
                if (postController.titleController.text.isNotEmpty ||
                    postController.bodyController.text.isNotEmpty) {
                  if (postController.postId.contains(widget.id.toInt())) {
                    navigatePostList;
                  } else {
                    await postController.storePost(widget.id.toInt());
                    Logger().i("Post ID: ${widget.id.toInt()}");
                    navigatePostList;
                  }
                } else {
                  navigatePostList;
                }
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
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFieldBuild(
                  maxLines: 1,
                  hint: "Title",
                  controller: postController.titleController,
                  error: postController.titleError,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFieldBuild(
                  maxLines: 5,
                  hint: "Body",
                  controller: postController.bodyController,
                  error: postController.bodyError,
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        await postController.updatePost(widget.id);

                        navigatePostList;
                      },
                      child: const Text(
                        'Submit',
                      )),
                )
              ],
            )));
  }
}
