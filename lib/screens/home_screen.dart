import 'package:blog_explorer/models/blog.dart';
import 'package:blog_explorer/providers/blog_provider.dart';
import 'package:blog_explorer/providers/network_provider.dart';
import 'package:blog_explorer/screens/favourite_screen.dart';
import 'package:blog_explorer/widgets/blog_list_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late AsyncValue<List<Blog>> data;
  Future<void> _onRefresh() async {
    final isInternetAvailable = await ref.refresh(networkProvider.future);
    data = ref.refresh(blogProvider);
    if (!isInternetAvailable && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No internet connection.'),
        ),
      );
    }
  }

  Future<void> checkInternetConnection() async {
    final isInternetAvailable = await ref.read(networkProvider.future);
    if (!isInternetAvailable && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No internet connection.'),
        ),
      );
    }
  }

  @override
  void initState() {
    checkInternetConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ref.watch(blogProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blogs'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FavouriteScreen()));
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: data.when(
        data: (data) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(20),
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.separated(
                itemCount: data.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 30,
                ),
                itemBuilder: (builder, index) {
                  final blog = data[index];
                  return BlogListItem(blog: blog);
                },
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          if (kDebugMode) {
            print(error.toString());
            print(stackTrace.toString());
          }
          return LayoutBuilder(
            builder: (context, constraints) => RefreshIndicator(
              onRefresh: _onRefresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  alignment: Alignment.center,
                  child: const Text(
                      "Something went wrong. Please try again later."),
                ),
              ),
            ),
          );
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
