import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/animate_item.widget.dart';
import 'package:provider/provider.dart';
class PostListBody extends StatelessWidget {
  const PostListBody({super.key});

  final options = const LiveOptions(
    
    showItemInterval: Duration(milliseconds: 300),

    showItemDuration: Duration(milliseconds: 300),

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
