import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/post.provider.dart';
import 'list_tile.widget.dart';

class FavoritePostBody extends StatelessWidget {
  const FavoritePostBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, value, child) {
        bool isFavoritesEmpty = value.favoritePostList.isEmpty;

        return isFavoritesEmpty
            ? const Center(
                child: Text('No Favorite Post to Display.'),
              )
            : ListView.builder(
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
    );
  }
}
