import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:provider/provider.dart';

import '../../../routing/app.router.gr.dart';

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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () async {
              if (postController.titleController.text.isNotEmpty ||
                  postController.bodyController.text.isNotEmpty) {
                await postController.storePost();
                context.router.navigate(PostRouteList());
              } else {
                context.router.navigate(PostRouteList());
              }
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.router.pushNamed("/post/draft");
                },
                icon: Icon(
                  Icons.drafts,
                  color: Colors.white,
                ))
          ],
          title: Text('Update Post'),
        ),
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
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            )));
  }
}
