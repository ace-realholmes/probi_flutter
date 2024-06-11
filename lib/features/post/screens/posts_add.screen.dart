import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final postController = Provider.of<PostProvider>(context);
    return PopScope(
      onPopInvoked: (didPop) async {
        if (postController.titleController.text.isNotEmpty ||
            postController.bodyController.text.isNotEmpty) {
          await postController.storePost();
          context.router.navigate(const PostRouteList());
        } else {
          context.router.navigate(const PostRouteList());
        }
      },
      child: Scaffold(
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
              appBarTitle: "Post Add",
              actionWidgets: [
                IconButton(onPressed: (){
                  context.router.pushNamed("/post/draft");
                }, icon: Icon(Icons.drafts))
              ]),
              
          body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: postController.titleController,
                    decoration: InputDecoration(hintText: "Title"),
                    minLines: 1,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: postController.bodyController,
                    decoration: InputDecoration(hintText: "Body"),
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () async {
                          await postController.createPost();

                          postController.titleController.clear();
                          postController.bodyController.clear();

                          context.router.pushNamed("/post/list");
                        },
                        child: Text(
                          'Submit',
                        )),
                  )
                ],
              ))),
    );
  }
}
