import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/features/post/widgets/post_favorite_body.widget.dart';
import 'package:provider/provider.dart';

/// A screen that displays the user's favorite posts.
///
/// This screen integrates with `PostProvider` to show a list of favorites posts.
/// If there are no favorite posts, it displays a message indicating the absence
/// of favorites.
@RoutePage()
class PostScreenFavorites extends StatelessWidget {
  /// Creates a `PostScreenFavorites` widget.
  const PostScreenFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Builds the app bar for the screen.
      ///
      /// Includes a back button for navigation and sets the title to "Post Favorites".
      appBar: AppBarWidget(
        leading: BackButton(
          onPressed: () => context.router.back(),
        ),
        appBarTitle: "Post Favorites",
      ),
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          /// Determines if the list of favorite posts is empty.
          bool isFavoritesEmpty = postProvider.favoritePostList.isEmpty;

          // Returns a message if there are no favorites, or the list of favorite posts otherwise.
          return isFavoritesEmpty
              ? const Center(child: Text('No Favorite Post to Display.'))
              : const PostFavoriteBodyWidget();
        },
      ),
    );
  }
}
