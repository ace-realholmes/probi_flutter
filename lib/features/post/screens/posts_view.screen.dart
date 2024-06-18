import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/features/post/widgets/post_view_body.widget.dart';
import 'package:probi_flutter/routing/app.router.gr.dart';
import 'package:provider/provider.dart';

/// A screen for viewing a specific post.
///
/// This screen allows users to view the details of a specific post. It
/// integrates with the `PostProvider` to retrieve and display post information.
/// Provides navigation options to go back, list posts, or update the current post.
@RoutePage()
class PostScreenView extends StatefulWidget {
  /// The ID of the post to be viewed.
  final int id;

  /// The index of the post in the list.
  final int index;

  /// Creates a `PostScreenView` widget.
  ///
  /// Requires [id] and [index] to specify which post to view.
  const PostScreenView({
    super.key,
    required this.id,
    required this.index,
  });

  @override
  State<PostScreenView> createState() => _PostScreenViewState();
}

/// State for `PostScreenView` widget.
///
/// Manages the lifecycle of the post viewing screen, including initializing the
/// `PostProvider` and handling navigation.
class _PostScreenViewState extends State<PostScreenView> {
  /// Instance of `PostProvider` for managing post data.
  late final postController = Provider.of<PostProvider>(context);

  /// Navigation method to go to the post list screen.
  late final navigatePostList = context.router.navigate(const PostRouteList());

  /// Navigation method to go to the post update screen.
  late final navigatePostUpdate =
      context.router.navigate(PostRouteUpdate(id: widget.id));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Builds the app bar for the screen.
      ///
      /// Includes a back button for navigation and sets the title to "Post View".
      appBar: buildAppBar(
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
      body: PostViewBody(id: widget.id, index: widget.index),
    );
  }
}
