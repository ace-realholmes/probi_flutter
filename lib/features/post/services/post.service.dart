import 'package:dio/dio.dart';
import 'package:probi_flutter/common/env.dart';
import 'package:probi_flutter/features/post/models/post.dart';

class PostApi {
  final dio = Dio();

  Future<List<Post>> getPosts() async {
    try {
      final response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List<dynamic>;
        List<Post> posts = data
            .map((json) => Post.fromJson(json as Map<String, dynamic>))
            .toList();

        return posts;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Failed to find posts: $e');
    }
  }
}
