import 'package:api_api/core/constants/text_styles.dart';
import 'package:api_api/features/post/presentation/bloc/post_bloc.dart';
import 'package:api_api/features/post/presentation/bloc/post_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostForm extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  PostForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Create a new post", style: AppTextStyles.dialogTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Title',
              labelStyle: AppTextStyles.labelText,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: bodyController,
            decoration: InputDecoration(
              labelText: 'Body',
              labelStyle: AppTextStyles.labelText,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),

      actions: [
        TextButton(
          onPressed: () {
            final postData = {
              'title': titleController.text,
              'body': bodyController.text,
            };
            context.read<PostBloc>().add(CreatePostEvent(postData));
            Navigator.pop(context);
          },
          child: Text("SUbmit", style: AppTextStyles.submitButton),
        ),
      ],
    );
  }
}
