import 'package:api_api/features/post/domain/entities/post.dart';
import 'package:api_api/features/post/presentation/bloc/post_bloc.dart';
import 'package:api_api/features/post/presentation/bloc/post_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          icon: Icon(Icons.delete),
          onPressed: () {
            // Trigger delete post event
            context.read<PostBloc>().add(DeletePostEvent(id: post.id));
          },
        ),
      ),
    );
  }
}
