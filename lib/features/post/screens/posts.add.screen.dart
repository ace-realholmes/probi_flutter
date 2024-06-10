import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/services/navigator.service.dart';
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
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () async {
              if(postController.titleController.text.isNotEmpty || postController.bodyController.text.isNotEmpty){
                await postController.storePost();
                context.router.back();
              } else{
                context.router.back();
              }
              
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.router.pushNamed("/post/draft");
                },
                icon: const Icon(Icons.drafts, color: Colors.white,))
          ],
          title: const Text('Add Post'),
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
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            )));
  }
}
