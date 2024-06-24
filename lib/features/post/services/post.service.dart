import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:probi_flutter/common/env.dart';
import 'package:probi_flutter/features/post/models/post.dart';

class PostService {
  PostService._();
  static final instance = PostService._();
  // static final _dio =
  //     Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  late Dio? _dio;

  init([Dio? dio]){
    _dio = dio;
  }


   Future<List<PostModel>> getAllPosts() async {
    try {
      final response = await _dio?.get('/posts');

      if (response?.statusCode == 200) {
        List<dynamic> data = response?.data as List<dynamic>;
        List<PostModel> posts = data
            .map((json) => PostModel.fromJson(json as Map<String, dynamic>))
            .toList();

        // Logger().d('Get Data: $data \n Get Posts: ${posts[10]}');

        return posts;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Failed to find posts: $e');
    }
  }

   Future<PostModel> getPost(int id) async {
    try {
      final response = await _dio?.get("/posts/$id");

      if (response?.statusCode == 200) {
        PostModel post =
            PostModel.fromJson(response?.data as Map<String, dynamic>);
        log('Get Post: ${post.body}');
        return post;
      } else {
        throw Exception('Failed to Get Post: ${response?.statusMessage}');
      }
    } catch (e) {
      throw Exception('Failed to Get Post: $e');
    }
  }

   Future<PostModel> postPost(PostModel post) async {
    try {
      final response = await _dio?.post('/posts',
          data: {"userId": 11, "title": post.title, "body": post.body});

      Logger().d("Post Post Service: $response");

      if (response?.statusCode == 201) {
        PostModel post =
            PostModel.fromJson(response?.data as Map<String, dynamic>);

        Logger().d('Post Post: $post');
        return post;
      } else {
        throw Exception('Failed to Post Post: ${response?.statusMessage}');
      }
    } catch (e) {
      throw Exception('Failed to Post Post: $e');
    }
  }

   Future<PostModel> putPost(int id) async {
    try {
      final response = await _dio?.put("/posts/$id");

      if (response?.statusCode == 200) {
        PostModel post =
            PostModel.fromJson(response?.data as Map<String, dynamic>);
        log("Put Post: $post");
        return post;
      } else {
        throw Exception("Failed to Put Post: ${response?.statusMessage}");
      }
    } catch (e) {
      throw Exception("Failed to Put Post: $e");
    }
  }

   Future<PostModel> patchPost(PostModel post) async {
    try {
      final response = await _dio?.patch("/posts/${post.id}",
          data: {"userId": 11, "title": post.title, "body": post.body});

      if (response?.statusCode == 200) {
        PostModel post =
            PostModel.fromJson(response?.data as Map<String, dynamic>);

        return post;
      } else {
        throw Exception("Failed to patch post: ${response?.statusMessage}");
      }
    } catch (e) {
      throw Exception("Failed to patch post: $e");
    }
  }

   Future<void> deletePost(int id) async {
    try {
      final response = await _dio?.delete("/posts/$id");

      if (response?.statusCode == 200) {
        Logger().d("Post Successfully Delete");
      } else {
        Logger().d("Post failed to delete");
        throw Exception("Failed to delete post: ${response?.statusMessage}");
      }
    } catch (e) {
      throw Exception("Failed to delete post: $e");
    }
  }
}
