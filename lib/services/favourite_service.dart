import 'package:blog_explorer/models/blog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final favouriteServiceProvider =
    Provider<FavouriteService>((ref) => FavouriteService());

class FavouriteService {
  late Box<Blog> _box;
  late List<Blog> _favouriteBlogs;

  List<Blog> getFavouriteBlogs() {
    _box = Hive.box('favouriteBlogs');
    _favouriteBlogs = _box.values.toList();
    return _favouriteBlogs;
  }

  List<Blog> addBlog(Blog blog) {
    _box.put(blog.id, blog);
    return _box.values.toList();
  }

  List<Blog> removeBlog(String id) {
    _box.delete(id);
    return _box.values.toList();
  }

  void deleteAll() {
    _box.clear();
  }
}
