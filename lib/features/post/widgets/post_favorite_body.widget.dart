import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../providers/post.provider.dart';
import 'list_tile.widget.dart';

class PostFavoriteBodyWidget extends StatelessWidget {
  const PostFavoriteBodyWidget({super.key});

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
                  return Animate(
                    effects: const [
                      FadeEffect(duration: Duration(milliseconds: 500)),
                      SlideEffect(
                          begin: Offset(0, 0.3),
                          duration: Duration(milliseconds: 500)),
                    ],
                    child: listTileWidget(
                        leadingWidget: const Icon(Icons.note),
                        titleTile:
                            value.favoritePostList[index].title.toString(),
                        subTile: value.favoritePostList[index].body.toString(),
                        trailingWidget: IconButton(
                            onPressed: () async {
                              await value.toggleFavoritePost(
                                  value.favoritePostList[index].id);
                            },
                            icon: const Icon(Icons.favorite))),
                  );
                });
      },
    );
  }
}
