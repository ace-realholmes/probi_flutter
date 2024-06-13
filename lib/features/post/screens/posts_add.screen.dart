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

  navigateToPostList() {
    context.router.navigate(const PostRouteList());
  }

  navigateToPostDraft() {
    context.router.pushNamed("/post/draft");
  }

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
              const SizedBox(height: 12),
              TextFieldBuild(
                maxLines: 5,
                hint: "Body",
                controller: postController.bodyController,
                error: postController.bodyError,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    bool isTitleEmpty =
                        postController.titleController.text.isEmpty;
                    bool isBodyEmpty =
                        postController.bodyController.text.isEmpty;

                    postController.toggleTitleError(isTitleEmpty);
                    postController.toggleBodyError(isBodyEmpty);

                    if (!isTitleEmpty && !isBodyEmpty) {
                      postController.createPost();
                      postController.titleController.clear();
                      postController.bodyController.clear();
                      navigateToPostList();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
