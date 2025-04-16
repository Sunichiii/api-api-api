import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // <-- Make sure this import exists
import 'package:api_api/core/constants/app_colors.dart';
import 'package:api_api/core/constants/text_styles.dart';
import 'package:api_api/features/post/presentation/bloc/post_bloc.dart';
import 'package:api_api/features/post/presentation/bloc/post_state.dart';
import 'package:api_api/features/post/presentation/widgets/post_form.dart';
import 'package:api_api/features/post/presentation/widgets/post_list.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts', style: AppTextStyles.appBarTitle),
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(context: context, builder: (_) => PostForm());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.message.isNotEmpty) {
              return Center(
                child: Text(state.message, style: AppTextStyles.errorText),
              );
            }

            return PostList(posts: state.posts);
          },
        ),
      ),
    );
  }
}
