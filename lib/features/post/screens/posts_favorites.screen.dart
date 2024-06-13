import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/features/post/widgets/list_tile.widget.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PostScreenFavorites extends StatelessWidget {
  const PostScreenFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          leading: BackButton(
            onPressed: () => context.router.back(),
          ),
          appBarTitle: "Post Favorites"),
      body: Consumer<PostProvider>(
        builder: (context, value, child) {
          // value.retrievePostFromStorage();

          return ListView.builder(
              itemCount: value.favoritePostList.length,
              itemBuilder: (BuildContext context, int index) {
                return buildListTile(
                    leadingWidget: const Icon(Icons.note),
                    titleTile: value.favoritePostList[index].title.toString(),
                    subTile: value.favoritePostList[index].body.toString(),
                    trailingWidget: IconButton(
                        onPressed: () async {
                          await value.toggleFavoritePost(
                              value.favoritePostList[index].id);
                        },
                        icon: const Icon(Icons.favorite)));
              });
        },
      ),
    );
  }
}
