import 'package:blog_explorer/models/blog.dart';
import 'package:blog_explorer/services/favourite_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favouriteBlogsProvider =
    StateNotifierProvider<FavouriteNotifier, List<Blog>>(
        (ref) => FavouriteNotifier(ref));

class FavouriteNotifier extends StateNotifier<List<Blog>> {
  FavouriteNotifier(this.ref) : super([]) {
    favouriteService = ref.read(favouriteServiceProvider);
    getBlogs();
  }

  late FavouriteService favouriteService;
  final StateNotifierProviderRef ref;

  void getBlogs() {
    state = favouriteService.getFavouriteBlogs();
  }

  void addBlog(Blog blog) {
    state = favouriteService.addBlog(blog);
  }

  void removeBlog(String id) {
    state = favouriteService.removeBlog(id);
  }
}
