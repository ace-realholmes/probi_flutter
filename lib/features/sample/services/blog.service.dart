import 'package:dio/dio.dart';

import 'package:probi_flutter/features/sample/models/post.model.dart';

class BlogService {
  static final _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  BlogService._();
  static final _instance = BlogService._();
  factory BlogService() {
    return _instance;
  }

  /// Publish a post
  static Future<PostModel> publish(PostModel post) async {
    final response = await _dio.post('/posts', data: post.toJson());

    return PostModel.fromJson(response.data);
  }
}
