import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/widgets/shimmer_grid_load.widget.dart';
import 'package:provider/provider.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/card_post.widget.dart';

class PostListBodyWidget extends StatefulWidget {
  const PostListBodyWidget({super.key});

  @override
  State<PostListBodyWidget> createState() => _PostListBodyWidgetState();
}

class _PostListBodyWidgetState extends State<PostListBodyWidget> {
  final options = const LiveOptions(
    showItemDuration: Duration(milliseconds: 500),
    showItemInterval: Duration(milliseconds: 100),
    visibleFraction: 0.05,
    reAnimateOnVisibility: false,
  );

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async {
        return fetchPosts();
      },
      child: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          if (postProvider.isLoading) {
            return const ShimmerGridLoader();
          } else if (postProvider.postIds.isEmpty) {
            return const Center(child: Text('No posts available'));
          } else {
            return LiveGrid.options(
              itemBuilder: cardPostWidget,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio:
                    screenSize.width / 0.4 / screenSize.height / 2,
                crossAxisCount: 2,
              ),
              shrinkWrap: true,
              itemCount: postProvider.postIds.length,
              options: options,
            );
          }
        },
      ),
    );
  }

  fetchPosts() async {
    setState(() => isLoading = true);

    await Future.delayed(Duration(seconds: 2));

    final provider = context.read<PostProvider>();

    await provider.getAllPosts();

    setState(() => isLoading = false);
  }
}
