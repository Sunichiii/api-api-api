import 'package:api_api/features/post/domain/entities/post.dart';
import 'package:api_api/features/post/presentation/widgets/post_item.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  final List<Post> posts;

  const PostList({required this.posts, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostItem(post: posts[index]);
      },
    );
  }
}
