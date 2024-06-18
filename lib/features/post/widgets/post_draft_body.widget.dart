import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/list_tile.widget.dart';
import 'package:provider/provider.dart';

import '../../../routing/app.router.gr.dart';

class PostDraftBody extends StatelessWidget {
  const PostDraftBody({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: (context, value, child) {
      bool isDraftEmpty;
      if (value.draftTitles.isEmpty) {
        isDraftEmpty = true;
      } else {
        isDraftEmpty = false;
      }

      return isDraftEmpty
          ? const Center(child: Text('No Draft to Display.'))
          : ListView.builder(
              itemCount: value.draftTitles.length,
              padding: const EdgeInsets.all(4),
              itemBuilder: (BuildContext context, int index) {
                return buildListTile(
                    leadingWidget: const Icon(Icons.drafts),
                    titleTile: value.draftTitles[index].toString(),
                    subTile: value.draftBodies[index].toString(),
                    trailingWidget: IconButton(
                        onPressed: () async {
                          context.router.popAndPush(const PostRouteAdd());
                          await value.editDraftPost(index);
                        },
                        icon: const Icon(Icons.edit)));
              });
    });
  }
}
