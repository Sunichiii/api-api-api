import 'package:api_api/features/post/domain/entities/post.dart';
import 'package:api_api/features/post/presentation/bloc/post_bloc.dart';
import 'package:api_api/features/post/presentation/bloc/post_event.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(post.body),
        trailing: IconButton(
          onPressed: () {
            context.read<PostBloc>().add(DeletePostEvent(id: post.id));
          },
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
