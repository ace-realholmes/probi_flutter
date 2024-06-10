import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PostScreenFavorites extends StatelessWidget {
  PostScreenFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    final postController = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.router.back();
          },
          color: Colors.white,
        ),
        title: const Text('Post Favorites'),
      ),
      body: ListView.builder(
          itemCount: postController.favoritePosts.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.note),
              title: Text(postController.favoritePosts[index].title),
              subtitle: Text(postController.favoritePosts[index].body),
              trailing: IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () async {
                  await postController.toggleFavoritePosts(postController.favoritePosts[index].id);
                },
              ),
            );
          }),
    );
  }
}
