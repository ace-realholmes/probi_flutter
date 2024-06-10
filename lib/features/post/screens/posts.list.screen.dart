import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:logger/logger.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/services/navigator.service.dart';
import 'package:probi_flutter/features/post/services/post.service.dart';
import 'package:probi_flutter/routing/app.router.gr.dart';
import 'package:probi_flutter/themes/default.themes.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PostScreenList extends StatefulWidget {
  const PostScreenList({super.key});

  @override
  State<PostScreenList> createState() => _PostScreenListState();
}

class _PostScreenListState extends State<PostScreenList> {
  List<int> data = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20
  ];

  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final postController = Provider.of<PostProvider>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // NavigationService().navigate('/post/add');

            PostApi().getAllPosts();
            // Logger().i("List Screen: ${postController.posts[1]}");
          },
          child: const Icon(Icons.add, color: Colors.white,),
        ),
        appBar: AppBar(
          title: const Text("Product List"),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(onPressed: (){
              context.router.pushNamed('/post/favorites');
            }, icon: Icon(Icons.list, color: Colors.white,)),
            IconButton(onPressed: (){}, icon: Icon(Icons.dark_mode_outlined, color: Colors.white,))
          ],
        ),
        body: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 1,
          children: List.generate(postController.posts.length, (index) {
            return GestureDetector(
              onTap: () {
                // context.router.pushNamed(PostRouteView(id: postController.posts[index].id));
                context.router.push(PostRouteView(id: postController.posts[index].id, index: index));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Post #${postController.posts[index].id}"),
                          SizedBox(width: 6,),
                          Text("- User #${postController.posts[index].userId.toString()}"),

                        ],
                      ),
                      Text(postController.posts[index].title, style: TextStyle(fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis),),
                      Text(
                        postController.posts[index].body,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
