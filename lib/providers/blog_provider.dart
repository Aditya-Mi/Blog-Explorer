import 'package:blog_explorer/services/api_service.dart';
import 'package:blog_explorer/models/blog.dart';
import 'package:blog_explorer/providers/network_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final blogProvider = FutureProvider<List<Blog>>((ref) async {
  final isInternetAvailable = await ref.read(networkProvider.future);
  final apiService = ref.read(apiServiceProvider);
  final box = Hive.box<Blog>('blogs');
  if (isInternetAvailable == true) {
    //fetching data from api
    debugPrint('fetching data from internet');
    //await DefaultCacheManager().removeFile('blogImages');
    final newBlogs = await apiService.fetchBlogs();
    await box.clear();
    await box.addAll(newBlogs.take(50));
    return newBlogs;
  } else {
    //fetching data from hive local storage
    debugPrint('fetching data from local storage');
    return box.values.toList();
  }
});
