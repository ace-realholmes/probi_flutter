import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:provider/provider.dart';

import '../../../routing/app.router.gr.dart';

class PostListBody extends StatelessWidget {
  const PostListBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Consumer<PostProvider>(
      builder: (context, value, child) {
        return GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: screenSize.width / 0.4 / screenSize.height / 2,
          children: List.generate(value.posts.length, (index) {
            return GestureDetector(
              onTap: () {
                context.router.push(
                    PostRouteView(id: value.postIds[index], index: index));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Image(
                        image: AssetImage('assets/sticky-notes.jpg'),
                        fit: BoxFit.cover,
                      ),
                      Row(
                        children: [
                          Text("Post #${value.postIds[index]}"),
                          const SizedBox(
                            width: 6,
                          ),
                          Text("- User #${value.userIds[index].toString()}"),
                        ],
                      ),
                      Text(
                        value.titles[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        value.bodies[index],
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
