import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/app_bar.widget.dart';
import 'package:probi_flutter/features/post/widgets/post_draft_body.widget.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PostScreenDraft extends StatefulWidget {
  const PostScreenDraft({super.key});

  @override
  State<PostScreenDraft> createState() => _PostScreenDraftState();
}

class _PostScreenDraftState extends State<PostScreenDraft> {
  late final postController = Provider.of<PostProvider>(context);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
            leading: BackButton(
              onPressed: () => context.router.back(),
            ),
            appBarTitle: "Post Draft"),
        body: const PostDraftBody());
  }
}
