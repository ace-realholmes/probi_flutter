import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/routing/app.router.gr.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PostScreenDraft extends StatefulWidget {
  const PostScreenDraft({super.key});

  @override
  State<PostScreenDraft> createState() => _PostScreenDraftState();
}

class _PostScreenDraftState extends State<PostScreenDraft> {
  @override
  Widget build(BuildContext context) {
    final postController = Provider.of<PostProvider>(context);
    postController.retrieveUserData;

    return Scaffold(
        appBar: AppBar(
          title: Text("Draft Posts"),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              context.router.back();
            },
          ),
        ),
        body: ListView.builder(
            itemCount: postController.title.length,
            padding: EdgeInsets.all(4),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: Icon(Icons.drafts),
                  title: Text(postController.title[index]),
                  subtitle: Text(postController.body[index]),
                  trailing: Icon(Icons.edit),
                  onTap: () async {
                    await postController.draftPost(index);

                    context.router.pushNamed("/post/add");
                  });
            }));
  }
}
