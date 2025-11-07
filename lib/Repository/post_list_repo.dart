import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc_practice/Models/PostModel.dart';
import 'package:http/http.dart' as http;

class PostListRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      final res = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments'),
        headers: {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (res.statusCode == 200) {
        final List<dynamic> data = await json.decode(res.body);
        return data.map((e) {
          return PostModel(
            postId: e['postId'] as int,
            id: e['id'] as int,
            name: e['name'] as String,
            email: e['email'] as String,
            body: e['body'] as String,
          );
        }).toList();
      } else {
        throw Exception('Failed to load posts. Status code: ${res.statusCode}');
      }
    } on TimeoutException {
      throw Exception('No internet connection (Timeout)');
    } on SocketException {
      throw Exception('Network error (SocketException)');
    } catch (e) {
      // Some other error
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
