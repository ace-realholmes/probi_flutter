import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:provider/provider.dart';

import '../../../routing/app.router.gr.dart';

Widget buildAnimatedItem(
  BuildContext context,
  int index,
  Animation<double> animation,
) =>
    FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.03),
          end: Offset.zero,
        ).animate(animation),
        child: Consumer<PostProvider>(
          builder: (context, value, child) {
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
          },
        ),
      ),
    );
