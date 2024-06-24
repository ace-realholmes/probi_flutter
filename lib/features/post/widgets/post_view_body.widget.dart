import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import '../../../routing/app.router.gr.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';

class PostViewBodyWidget extends StatelessWidget {
  const PostViewBodyWidget({super.key, required this.id, required this.index});

  final int id;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Animate(
                effects: [
                  FadeEffect(
                    duration: (350.ms),
                  ),
                  SlideEffect(duration: (350.ms), begin: const Offset(0, -0.2))
                ],
                child: Row(
                  children: [
                    const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      'User #${value.userIds[index].toString()}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const Expanded(
                        child: SizedBox(
                      height: 0,
                    )),
                    Consumer<PostProvider>(
                      builder: (context, value, child) {
                        final isFave = value.favoritePostIds.contains(id);

                        return IconButton(
                          onPressed: () => value.toggleFavoritePost(id),
                          icon: Icon(
                              isFave ? Icons.favorite : Icons.favorite_border),
                        );
                      },
                    ),
                    PopupMenuButton<String>(
                      onSelected: (String result) =>
                          onSelected(result, context, value),
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
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Animate(
                effects: [
                  FadeEffect(duration: 350.ms, delay: (400.ms)),
                  SlideEffect(
                      duration: 350.ms,
                      delay: (400.ms),
                      begin: const Offset(-0.05, 0))
                ],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Post #${value.postIds[id].toString()}"),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      value.titles[index],
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      value.bodies[index],
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> onSelected(
      String? result, BuildContext context, PostProvider postProvider) async {
    final router = context.router;

    if (result == 'update') {
      router.navigate(PostUpdateRoute(id: id));
      await postProvider.toUpdatePost(id);
    } else if (result == 'delete') {
      await postProvider.deletePost(id);
      router.push(const PostListRoute());
    }
  }
}
