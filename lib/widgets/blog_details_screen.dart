import 'package:blog_explorer/models/blog.dart';
import 'package:blog_explorer/providers/favourite_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogDetailsScreen extends ConsumerStatefulWidget {
  final Blog blog;
  const BlogDetailsScreen({super.key, required this.blog});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends ConsumerState<BlogDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteBlogs = ref.watch(favouriteBlogsProvider);
    final isFavourite = favouriteBlogs.contains(widget.blog);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                if (isFavourite) {
                  ref
                      .read(favouriteBlogsProvider.notifier)
                      .removeBlog(widget.blog.id);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Removed from favourites'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          ref
                              .read(favouriteBlogsProvider.notifier)
                              .addBlog(widget.blog);
                        },
                      ),
                    ),
                  );
                } else {
                  ref
                      .read(favouriteBlogsProvider.notifier)
                      .addBlog(widget.blog);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added to favourites')));
                }
              },
              icon: isFavourite
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: CachedNetworkImage(
                    imageUrl: widget.blog.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Container(
                      color: Colors.black12,
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.black12,
                      child: const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.blog.title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.blog.description,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
