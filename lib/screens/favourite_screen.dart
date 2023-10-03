import 'package:blog_explorer/providers/favourite_provider.dart';
import 'package:blog_explorer/widgets/blog_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteScreen extends ConsumerStatefulWidget {
  const FavouriteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavouriteScreenState();
}

class _FavouriteScreenState extends ConsumerState<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final blogs = ref.watch(favouriteBlogsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: blogs.isEmpty
            ? const Center(
                child: Text('No blogs in faovurites'),
              )
            : ListView.separated(
                itemBuilder: (builder, index) {
                  return BlogListItem(blog: blogs[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 30,
                ),
                itemCount: blogs.length,
              ),
      ),
    );
  }
}
