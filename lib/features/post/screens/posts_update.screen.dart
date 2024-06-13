import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
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
  late var navigateToPostList = context.router.navigate(const PostRouteList());

  @override
  Widget build(BuildContext context) {
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
                          bool isTitleEmpty =
                              postController.titleController.text.isEmpty;
                          bool isBodyEmpty =
                              postController.bodyController.text.isEmpty;

                          postController.toggleTitleError(isTitleEmpty);
                          postController.toggleBodyError(isBodyEmpty);

                          if (!isTitleEmpty && !isBodyEmpty) {
                            await postController.updatePost(widget.id);
                            navigateToPostList;
                          }
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
