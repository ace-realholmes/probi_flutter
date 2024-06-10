import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:probi_flutter/common/env.dart';
import 'package:probi_flutter/features/post/models/post.dart';

class PostApi {
  final dio = Dio();

  Future<List<Post>> getAllPosts() async {
    try {
      final response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List<dynamic>;
        List<Post> posts = data
            .map((json) => Post.fromJson(json as Map<String, dynamic>))
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

  Future<Post> getPost(int id) async{
    try{
      final response = await dio.get("$baseUrl/$id");

      if(response.statusCode == 200){
        Post post = Post.fromJson(response.data as Map<String, dynamic>);
        print('Get Post: ${post.body}');
        return post;
        
      } else{
        throw Exception('Failed to Get Post: ${response.statusMessage}');
      }

    } catch(e){
      throw Exception('Failed to Get Post: $e');
    }
  }

  Future<Post> postPost(String title, String body) async {
    try{
      final response = await dio.post(baseUrl, data: {"userId": 11, "title": title, "body": body});

      Logger().d("Post Post Service: $response");

      if(response.statusCode == 201){
        Post post = Post.fromJson(response.data as Map<String, dynamic>);

        Logger().d('Post Post: $post');
        return post;
      } else{
        throw Exception('Failed to Post Post: ${response.statusMessage}');
      }
    } catch (e){
      throw Exception('Failed to Post Post: $e');
    }
  }

  Future<Post> putPost(int id) async {
    try{
      final response = await dio.put("$baseUrl/$id");

      if(response.statusCode == 200){
        Post post = Post.fromJson(response.data as Map<String, dynamic>);
        print("Put Post: $post");
        return post;
      }else {
        throw Exception("Failed to Put Post: ${response.statusMessage}");
      }

    } catch(e){
      throw Exception("Failed to Put Post: $e");
    }
  }

  Future<Post> patchPost(int id) async{
    try{
      final response = await dio.patch("$baseUrl/$id");

      if(response.statusCode == 200){
        Post post = Post.fromJson(response.data as Map<String, dynamic>);
        print("Patch post: ${post.body}");
        return post;
      } else {
        throw Exception("Failed to patch post: ${response.statusMessage}");
      }

    } catch(e){
      throw Exception("Failed to patch post: $e");
    }
  }

  Future<void> deletePost(int id) async{
    try{
      final response = await dio.delete("$baseUrl/$id");

      if(response.statusCode == 200) {
        print("Post successfully deleted");
      } else{
        print("Post failed to delete");
        throw Exception("Failed to delete post: ${response.statusMessage}");
      }

    } catch(e){
      throw Exception("Failed to delete post: $e");
    }
  }
}
