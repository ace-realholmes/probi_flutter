import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/features/post/widgets/post_update_body.widget.dart';
import 'package:probi_flutter/routing/app.router.gr.dart';
import 'package:provider/provider.dart';

/// A screen for updating an existing posts
///
/// This screen provides a form for updating existing posts and integrates with the
/// `PostProvider` to handle draft storage and navigation.
@RoutePage()
class PostScreenUpdate extends StatefulWidget {
  const PostScreenUpdate({super.key, required this.id});
  final int id;

  @override
  State<PostScreenUpdate> createState() => _PostScreenUpdateState();
}

/// State for `PostScreenUpdate` widget.
///
/// Manages the form for updating posts, handles navigation to post list and draft screens,
/// and stores drafts when the user attempts to leave the screen.
class _PostScreenUpdateState extends State<PostScreenUpdate> {
  /// Navigation method to go to the post list screen.
  late var navigateToPostList = context.router.navigate(const PostRouteList());

  /// Instance of `PostProvider` for managing post operations.
  late final postController = Provider.of<PostProvider>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      /// Called when the user attempts to navigate back.
      ///
      /// Stores the current draft and navigates to the post list.
      onPopInvoked: (didPop) async {
        navigateToPostList;
        await postController.storeDraft();
      },
      child: Scaffold(

          /// Prevents the bottom inset adjustment when the keyboard is shown.
          resizeToAvoidBottomInset: false,

          /// Builds the app bar for the screen.
          ///
          /// Includes a back button which stores the draft and navigates to the post list,
          /// and an action button to navigate to the drafts screen.
          appBar: buildAppBar(
              leading: BackButton(
                onPressed: () async {
                  await postController.storeDraft();
                  navigateToPostList;

                  // Reset the error states for title and body fields.
                  postController.toggleTitleError(false);
                  postController.toggleBodyError(false);
                },
              ),
              appBarTitle: "Post Update",
              actionWidgets: [
                IconButton(
                    onPressed: () {
                      context.router.pushNamed("/post/draft");
                    },
                    icon: const Icon(Icons.drafts))
              ]),

          /// Builds the body of the screen.
          ///
          /// Contains the form for updating an existing post.
          body: PostUpdateBody(id: widget.id)),
    );
  }
}
