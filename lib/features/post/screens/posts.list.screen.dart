import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:logger/logger.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/providers/theme.provider.dart';
import 'package:probi_flutter/features/post/services/navigator.service.dart';
import 'package:probi_flutter/features/post/services/post.service.dart';
import 'package:probi_flutter/routing/app.router.gr.dart';
import 'package:probi_flutter/themes/default.themes.dart';
import 'package:probi_flutter/themes/global.themes.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PostScreenList extends StatefulWidget {
  const PostScreenList({super.key});

  @override
  State<PostScreenList> createState() => _PostScreenListState();
}

class _PostScreenListState extends State<PostScreenList> {
  
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    final postController = Provider.of<PostProvider>(context);
    final themeController = Provider.of<ThemeProvider>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.push(PostRouteAdd());

            PostApi().getAllPosts();
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        appBar: AppBar(
          title: const Text("Product List"),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  context.router.pushNamed('/post/favorites');
                },
                icon: const Icon(
                  Icons.list,
                )),
            IconButton(
                onPressed: () {
                  if(isDarkMode != false){
                    themeController.setDarkScheme(GlobalThemData.darkColorScheme);
                  } else{
                    themeController.setLightScheme(GlobalThemData.lightColorScheme);
                  }
                },
                icon: isDarkMode ? Icon(Icons.dark_mode) : Icon(Icons.dark_mode_outlined)
                )
          ],
        ),
        body: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: screenSize.width / 0.4 / screenSize.height / 2,
          children: List.generate(postController.posts.length, (index) {
            return GestureDetector(
              onTap: () {
                // context.router.pushNamed(PostRouteView(id: postController.posts[index].id));
                context.router.push(PostRouteView(
                    id: postController.posts[index].id, index: index));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage('assets/sticky-notes.jpg'),
                        fit: BoxFit.cover,
                      ),
                      Row(
                        children: [
                          Text("Post #${postController.posts[index].id}"),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                              "- User #${postController.posts[index].userId.toString()}"),
                        ],
                      ),
                      Text(
                        postController.posts[index].title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        postController.posts[index].body,
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
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
