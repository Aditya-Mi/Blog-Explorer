import 'dart:convert';

import 'package:blog_explorer/models/blog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  final String url = "https://intent-kit-16.hasura.app/api/rest/blogs";
  final String adminSecret =
      '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
  Future<List<Blog>> fetchBlogs() async {
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });
      if (response.statusCode != 200) {
        throw 'An unexpected error occurred ';
      }
      final data = jsonDecode(response.body);
      final List result = data["blogs"];
      var res = result.map((blog) => Blog.fromJson(blog)).toList();
      return res;
    } catch (e) {
      throw e.toString();
    }
  }
}
