import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/features/post/widgets/text_field.widget.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PostScreenUpdate extends StatefulWidget {
  const PostScreenUpdate({super.key});

  @override
  State<PostScreenUpdate> createState() => _PostScreenUpdateState();
}

class _PostScreenUpdateState extends State<PostScreenUpdate> {
  @override
  Widget build(BuildContext context) {
    final postController = Provider.of<PostProvider>(context);

    return Scaffold(
        appBar: buildAppBar(
            leading: BackButton(
              onPressed: () async {
                if (postController.titleController.text.isNotEmpty ||
                    postController.bodyController.text.isNotEmpty) {
                  await postController.storePost();
                  context.router.navigateNamed("/post/list");
                } else {
                  context.router.navigateNamed("/post/list");
                }
              },
            ),
            appBarTitle: "Post Update",
            actionWidgets: [
              IconButton(
                  onPressed: () {
                    context.router.pushNamed("/post/draft");
                  },
                  icon: Icon(Icons.drafts))
            ]),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFieldBuild(
                    maxLines: 1,
                    hint: "Title",
                    controller: postController.titleController),
                const SizedBox(
                  height: 12,
                ),
                TextFieldBuild(
                    maxLines: 5,
                    hint: "Body",
                    controller: postController.bodyController),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        context.router.replaceNamed('/post/list');
                      },
                      child: const Text(
                        'Submit',
                      )),
                )
              ],
            )));
  }
}
