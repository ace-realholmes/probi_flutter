import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:probi_flutter/routing/app.router.gr.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/post_add_body.widget.dart';

/// A screen for adding new posts.
///
/// This screen provides a form for adding new posts and integrates with the
/// `PostProvider` to handle draft storage and navigation.
@RoutePage()
class PostAddScreen extends StatefulWidget {
  /// Creates a `PostAddScreen` widget.
  const PostAddScreen({super.key});

  @override
  State<PostAddScreen> createState() => _PostAddScreenState();
}

/// State for `PostAddScreen` widget.
///
/// Manages the form for adding posts, handles navigation to post list and draft screens,
/// and stores drafts when the user attempts to leave the screen.
class _PostAddScreenState extends State<PostAddScreen> {
  /// Navigation method to go to the post list screen.
  void navigateToPostList() {
    context.router.navigate(const PostListRoute());
  }

  /// Navigation method to go to the post drafts screen.
  void navigateToPostDraft() {
    context.router.pushNamed("/post/draft");
  }

  /// Instance of `PostProvider` for managing post operations.
  late final postProvider = Provider.of<PostProvider>(context, listen: false);

  ///
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      /// Called when the user attempts to navigate back.
      ///
      /// Stores the current draft and navigates to the post list.
      onPopInvoked: (didPop) async {
        await postProvider.storeDraft();
        navigateToPostList();
      },
      child: SafeArea(
        child: Scaffold(
          /// Prevents the bottom inset adjustment when the keyboard is shown.
          resizeToAvoidBottomInset: false,
        
          /// Builds the app bar for the screen.
          ///
          /// Includes a back button which stores the draft and navigates to the post list,
          /// and an action button to navigate to the drafts screen.
          appBar: appBarWidget(
            leading: BackButton(
              onPressed: () async {
                await postProvider.storeDraft();
                navigateToPostList();
        
                // Reset the error states for title and body fields.
                postProvider.toggleTitleError(false);
                postProvider.toggleBodyError(false);
              },
            ),
            appBarTitle: "Post Add",
            actionWidgets: [
              IconButton(
                onPressed: () {
                  navigateToPostDraft();
                },
                icon: const Icon(Icons.drafts),
              )
            ],
          ),
        
          /// Builds the body of the screen.
          ///
          /// Contains the form for adding a new post.
          body: PostAddBodyWidget(),
        ),
      ),
    );
  }
}
