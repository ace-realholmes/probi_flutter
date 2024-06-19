import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:probi_flutter/features/post/providers/theme.provider.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/features/post/widgets/post_list_body.widget.dart';
import 'package:probi_flutter/routing/app.router.gr.dart';
import 'package:provider/provider.dart';

/// A screen for displaying the list of posts.
///* Home page of the application
///
/// This screen integrates with `PostProvider` to show a list of favorites posts.
/// Provides a button in the app bar to toggle themes and navigation to favorite post
/// lists and add form.
@RoutePage()
class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// Includes floating action button on the screen, once clicked the
        /// user is navigated to add form, allowing him to add posts
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.push(const PostAddRoute());

            /// For Sample Create Post
            // context.router.push(const SamplePostCreateRoute());
          },
          child: const Icon(
            Icons.add,
          ),
        ),

        /// Builds the app bar for the screen.
        ///
        /// Includes two action widgets
        /// [1] Favorite Lists - once clicked, the user is navigated to list of favorites
        /// [2] Theme Mode - once clicked, the theme of the app will be updated to dark or
        /// light theme.
        appBar: appBarWidget(appBarTitle: "Post List", actionWidgets: [
          IconButton(
              onPressed: () {
                context.router.pushNamed("/post/favorites");
              },
              icon: const Icon(Icons.list)),
          Consumer<ThemeProvider>(
            builder: (context, value, child) {
              bool isDarkMode = false;

              if (value.themeMode == ThemeMode.light) {
                isDarkMode = false;
              } else {
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

        /// Builds the body of the screen.
        ///
        /// Contains the list view builder to display list of posts.
        body: const PostListBodyWidget());
  }
}
