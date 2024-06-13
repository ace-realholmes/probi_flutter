import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/features/post/widgets/text_field.widget.dart';
import 'package:probi_flutter/routing/app.router.gr.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PostScreenAdd extends StatefulWidget {
  const PostScreenAdd({super.key});
  @override
  State<PostScreenAdd> createState() => _PostScreenAddState();
}

class _PostScreenAddState extends State<PostScreenAdd> {
  late final postController = Provider.of<PostProvider>(context);
  late var navigatePostList = context.router.navigate(const PostRouteList());
  
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        if (postController.titleController.text.isNotEmpty ||
            postController.bodyController.text.isNotEmpty) {
          await postController.storePost(0);
          navigatePostList;
        } else {
          navigatePostList;
        }
      },
      child: Scaffold(
          appBar: buildAppBar(
              leading: BackButton(
                onPressed: () async {
                  if (postController.titleController.text.isNotEmpty ||
                      postController.bodyController.text.isNotEmpty) {
                    await postController.storePost(0);
                    navigatePostList;
                  } else {
                    navigatePostList;
                  }
                },
              ),
              appBarTitle: "Post Add",
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
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () async {
                          await postController.createPost();

                          postController.titleController.clear();
                          postController.bodyController.clear();

                          navigatePostList;
                        },
                        child: const Text(
                          'Submit',
                        )),
                  )
                ],
              ))),
    );
  }
}
