import 'package:blog_explorer/models/blog.dart';
import 'package:blog_explorer/widgets/blog_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogListItem extends ConsumerStatefulWidget {
  const BlogListItem({required this.blog, super.key});
  final Blog blog;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenItemState();
}

class _HomeScreenItemState extends ConsumerState<BlogListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BlogDetailsScreen(blog: widget.blog),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              key: UniqueKey(),
              imageUrl: widget.blog.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.black12,
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.black12,
                child: const Icon(Icons.error),
              ),
              cacheManager: CacheManager(
                Config(
                  'blogImages',
                  stalePeriod: const Duration(days: 1),
                  maxNrOfCacheObjects: 30,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.blog.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
