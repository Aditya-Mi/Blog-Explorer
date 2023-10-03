// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogAdapter extends TypeAdapter<Blog> {
  @override
  final int typeId = 1;

  @override
  Blog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Blog(
      id: fields[0] as String,
      imageUrl: fields[1] as String,
      title: fields[2] as String,
      description: fields[3] == null
          ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nec tincidunt praesent semper feugiat nibh sed pulvinar proin. Tellus orci ac auctor augue mauris augue neque. Tortor dignissim convallis aenean et tortor at risus. Aliquet bibendum enim facilisis gravida neque. Sodales neque sodales ut etiam sit amet nisl purus. Nulla facilisi etiam dignissim diam quis enim. Cras tincidunt lobortis feugiat vivamus at augue eget arcu. In dictum non consectetur a erat. Tempus iaculis urna id volutpat lacus laoreet. Etiam tempor orci eu lobortis. Adipiscing elit ut aliquam purus sit. Massa sed elementum tempus egestas sed sed risus pretium quam. Dui sapien eget mi proin sed libero enim sed faucibus. In fermentum posuere urna nec tincidunt. Tellus pellentesque eu tincidunt tortor aliquam nulla. Massa sed elementum tempus egestas sed sed risus. Arcu non sodales neque sodales ut etiam sit.\nSed augue lacus viverra vitae congue eu consequat ac. Aenean et tortor at risus viverra. Tincidunt dui ut ornare lectus sit amet. Nisi scelerisque eu ultrices vitae auctor eu augue ut. Morbi quis commodo odio aenean. Risus quis varius quam quisque id diam. Enim nunc faucibus a pellentesque sit amet porttitor. In nibh mauris cursus mattis molestie a iaculis at. Vel risus commodo viverra maecenas accumsan lacus. Vel turpis nunc eget lorem dolor. Dolor sit amet consectetur adipiscing elit duis.\nVulputate mi sit amet mauris. Ac odio tempor orci dapibus ultrices in iaculis. Elementum sagittis vitae et leo. Et magnis dis parturient montes nascetur. Risus feugiat in ante metus. Euismod in pellentesque massa placerat duis. Ut tellus elementum sagittis vitae. Viverra suspendisse potenti nullam ac tortor vitae purus faucibus. Urna cursus eget nunc scelerisque viverra mauris. Vestibulum lorem sed risus ultricies tristique nulla.'
          : fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Blog obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
