import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/features/post/widgets/post_favorite_body.widget.dart';
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
            bool isFavoritesEmpty = false;
            if (value.favoritePostList.isEmpty) {
              isFavoritesEmpty = true;
            } else {
              isFavoritesEmpty = false;
            }

            return isFavoritesEmpty
                ? const Center(child: Text('No Favorite Post to Display.'))
                : const FavoritePostBody();
          },
        ));
  }
}
