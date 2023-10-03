import 'package:hive/hive.dart';

part 'blog.g.dart';

const String desc =
    """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nec tincidunt praesent semper feugiat nibh sed pulvinar proin. Tellus orci ac auctor augue mauris augue neque. Tortor dignissim convallis aenean et tortor at risus. Aliquet bibendum enim facilisis gravida neque. Sodales neque sodales ut etiam sit amet nisl purus. Nulla facilisi etiam dignissim diam quis enim. Cras tincidunt lobortis feugiat vivamus at augue eget arcu. In dictum non consectetur a erat. Tempus iaculis urna id volutpat lacus laoreet. Etiam tempor orci eu lobortis. Adipiscing elit ut aliquam purus sit. Massa sed elementum tempus egestas sed sed risus pretium quam. Dui sapien eget mi proin sed libero enim sed faucibus. In fermentum posuere urna nec tincidunt. Tellus pellentesque eu tincidunt tortor aliquam nulla. Massa sed elementum tempus egestas sed sed risus. Arcu non sodales neque sodales ut etiam sit.
Sed augue lacus viverra vitae congue eu consequat ac. Aenean et tortor at risus viverra. Tincidunt dui ut ornare lectus sit amet. Nisi scelerisque eu ultrices vitae auctor eu augue ut. Morbi quis commodo odio aenean. Risus quis varius quam quisque id diam. Enim nunc faucibus a pellentesque sit amet porttitor. In nibh mauris cursus mattis molestie a iaculis at. Vel risus commodo viverra maecenas accumsan lacus. Vel turpis nunc eget lorem dolor. Dolor sit amet consectetur adipiscing elit duis.
Vulputate mi sit amet mauris. Ac odio tempor orci dapibus ultrices in iaculis. Elementum sagittis vitae et leo. Et magnis dis parturient montes nascetur. Risus feugiat in ante metus. Euismod in pellentesque massa placerat duis. Ut tellus elementum sagittis vitae. Viverra suspendisse potenti nullam ac tortor vitae purus faucibus. Urna cursus eget nunc scelerisque viverra mauris. Vestibulum lorem sed risus ultricies tristique nulla.""";

@HiveType(typeId: 1)
class Blog {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String imageUrl;
  @HiveField(2)
  final String title;
  @HiveField(3, defaultValue: desc)
  String description;

  Blog({
    required this.id,
    required this.imageUrl,
    required this.title,
    this.description = desc,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      imageUrl: json['image_url'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'image_url': imageUrl,
      'title': title,
    };
  }
}
