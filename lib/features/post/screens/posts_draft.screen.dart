import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/features/post/widgets/post_draft_body.widget.dart';

/// A screen for displaying draft posts.
///
/// This screen provides an edit button to continue editing draft posts
@RoutePage()
class PostScreenDraft extends StatefulWidget {
  const PostScreenDraft({super.key});

  @override
  State<PostScreenDraft> createState() => _PostScreenDraftState();
}

class _PostScreenDraftState extends State<PostScreenDraft> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        /// Builds the app bar for the screen.
        ///
        /// Includes a back button for navigating back to add form
        appBar: appBarWidget(
            leading: BackButton(
              onPressed: () => context.router.back(),
            ),
            appBarTitle: "Post Draft"),

        /// Builds the body of the screen.
        ///
        /// Contains the list view builder to display list of draft posts
        body: const PostDraftBodyWidget());
  }
}
