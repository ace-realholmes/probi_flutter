import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/providers/theme.provider.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/routing/app.router.gr.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PostScreenList extends StatefulWidget {
  const PostScreenList({super.key});

  @override
  State<PostScreenList> createState() => _PostScreenListState();
}

class _PostScreenListState extends State<PostScreenList> {
  bool isDarkMode = false;
  late var screenSize = MediaQuery.of(context).size;
  late final postController = Provider.of<PostProvider>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.push(const PostRouteAdd());
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        appBar: buildAppBar(appBarTitle: "Post List", actionWidgets: [
          IconButton(
              onPressed: () {
                context.router.pushNamed("/post/favorites");
              },
              icon: const Icon(Icons.list)),
          Consumer<ThemeProvider>(
            builder: (context, value, child) {
              bool isDarkMode = false;

              if(value.themeMode == ThemeMode.light){
                isDarkMode = false;
              }else{
                isDarkMode = true;
              }
              return IconButton(  
                onPressed: () {
                  value.toggleTheme();
                },
                icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
              );
            },
          )
        ]),
        body: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: screenSize.width / 0.4 / screenSize.height / 2,
          children: List.generate(postController.posts.length, (index) {
            return GestureDetector(
              onTap: () {
                context.router.push(PostRouteView(
                    id: postController.posts[index].id, index: index));
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
