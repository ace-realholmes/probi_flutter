import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/card_post.widget.dart';
import 'package:provider/provider.dart';
class PostListBody extends StatelessWidget {
  const PostListBody({super.key});

  final options = const LiveOptions(

    showItemDuration: Duration(milliseconds: 500),
    showItemInterval: Duration(milliseconds: 100),

    visibleFraction: 0.05,
    reAnimateOnVisibility: false,
  );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Consumer<PostProvider>(
      builder: (context, value, child) {
        return LiveGrid.options(
            itemBuilder: buildAnimatedItem,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: screenSize.width / 0.4 / screenSize.height / 2,
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            itemCount: value.postIds.length,
            options: options);
      },
    );
  }
}
