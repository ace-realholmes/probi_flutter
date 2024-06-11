import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/features/post/widgets/list_tile.widget.dart';
import 'package:probi_flutter/routing/app.router.gr.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PostScreenDraft extends StatefulWidget {
  const PostScreenDraft({super.key});

  @override
  State<PostScreenDraft> createState() => _PostScreenDraftState();
}

class _PostScreenDraftState extends State<PostScreenDraft> {
  late final postController = Provider.of<PostProvider>(context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
            leading: BackButton(
              onPressed: () => context.router.back(),
            ),
            appBarTitle: "Post Draft"),
        body: ListView.builder(
            itemCount: postController.title.length,
            padding: const EdgeInsets.all(4),
            itemBuilder: (BuildContext context, int index) {
              return buildListTile(
                  leadingWidget: const Icon(Icons.drafts),
                  titleTile: postController.title[index].toString(),
                  subTile: postController.body[index].toString(),
                  trailingWidget: IconButton(
                      onPressed: () async {
                        await postController.draftPost(index);

                        context.router.popAndPush(const PostRouteAdd());
                      },
                      icon: const Icon(Icons.edit)));
            }));
  }
}
