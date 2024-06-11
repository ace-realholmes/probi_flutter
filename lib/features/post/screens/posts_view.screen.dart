import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/routing/app.router.gr.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PostScreenView extends StatefulWidget {
  final int id;
  final int index;
  const PostScreenView({super.key, required this.id, required this.index});

  @override
  State<PostScreenView> createState() => _PostScreenViewState();
}

class _PostScreenViewState extends State<PostScreenView> {
  late final postController = Provider.of<PostProvider>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        leading: IconButton(
            onPressed: () {
              context.router.back();
            },
            icon: const Icon(Icons.arrow_back)),
        appBarTitle: 'Post View',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'User #${postController.posts[widget.index].userId}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const Expanded(
                    child: SizedBox(
                  height: 0,
                )),
                Consumer<PostProvider>(
                  builder: (context, value, child) {
                    final isFave = value.favoritePost.contains(widget.id);

                    return IconButton(
                      onPressed: () => value.toggleFavoritePosts(widget.id),
                      icon:
                          Icon(isFave ? Icons.favorite : Icons.favorite_border),
                    );
                  },
                ),
                PopupMenuButton<String>(
                  onSelected: (String result) async {
                    if (result == 'update') {
                      await postController.toUpdatePost(widget.id);

                      context.router.push(PostRouteUpdate(id: widget.id));
                    } else if (result == 'delete') {
                      await postController.deletePost(widget.id);

                      context.router.pushNamed('/post/list');
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'update',
                      child: Row(
                        children: [
                          Icon(Icons.edit, color: Colors.blue),
                          SizedBox(width: 8),
                          Text('Update'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Delete'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Text("Post #${postController.posts[widget.index].id.toString()}"),
            const SizedBox(
              height: 6,
            ),
            Text(
              postController.posts[widget.index].title,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              postController.posts[widget.index].body,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
