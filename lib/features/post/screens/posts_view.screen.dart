import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/features/post/widgets/post_view_body.widget.dart';
import 'package:probi_flutter/routing/app.router.gr.dart';

/// A screen for viewing a specific post.
///
/// This screen allows users to view the details of a specific post. It
/// integrates with the `PostProvider` to retrieve and display post information.
/// Provides navigation options to go back, list posts, or update the current post.
@RoutePage()
class PostViewScreen extends StatefulWidget {
  /// The ID of the post to be viewed.
  final int id;

  /// The index of the post in the list.
  final int index;

  /// Creates a `PostViewScreen` widget.
  ///
  /// Requires [id] and [index] to specify which post to view.
  const PostViewScreen({
    super.key,
    required this.id,
    required this.index,
  });

  @override
  State<PostViewScreen> createState() => _PostViewScreenState();
}

/// State for `PostViewScreen` widget.
///
/// Manages the lifecycle of the post viewing screen, including initializing the
/// `PostProvider` and handling navigation.
class _PostViewScreenState extends State<PostViewScreen> {
  /// Navigation method to go to the post list screen.
  late final navigatePostList = context.router.navigate(const PostListRoute());

  /// Navigation method to go to the post update screen.
  late final navigatePostUpdate =
      context.router.navigate(PostUpdateRoute(id: widget.id));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /// Builds the app bar for the screen.
        ///
        /// Includes a back button for navigation and sets the title to "Post View".
        appBar: appBarWidget(
          leading: IconButton(
            onPressed: () {
              context.router.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          appBarTitle: 'Post View',
        ),
      
        /// Builds the body of the screen.
        ///
        /// Displays the content of the post specified by [id] and [index].
        body: PostViewBodyWidget(id: widget.id, index: widget.index),
      ),
    );
  }
}
