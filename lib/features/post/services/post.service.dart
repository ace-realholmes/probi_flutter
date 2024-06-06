

import 'package:dio/dio.dart';
import 'package:probi_flutter/common/env.dart';

class PostApi {
  final dio = Dio();

  Future<void> getPosts() async {
    try{
      final response = await dio.get(baseUrl);

      if(response.statusCode == 200){
        
      }
    } catch (e){
      throw Exception('Failed to find posts: $e');
    }

  }

}