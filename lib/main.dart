import 'package:api_api/core/network/api_client.dart';
import 'package:api_api/core/network/api_service.dart';
import 'package:api_api/features/post/data/datasources/post_remote_data_source.dart';
import 'package:api_api/features/post/data/repositories/post_repository_impl.dart';
import 'package:api_api/features/post/domain/usecases/create_posts.dart';
import 'package:api_api/features/post/domain/usecases/delete_posts.dart';
import 'package:api_api/features/post/domain/usecases/get_posts.dart';
import 'package:api_api/features/post/domain/usecases/update_posts.dart';
import 'package:api_api/features/post/presentation/bloc/post_bloc.dart';
import 'package:api_api/features/post/presentation/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final apiClient = ApiClient();
  final apiService = ApiService(apiClient: apiClient);
  final postRemoteDataSource = PostRemoteDataSource(apiService: apiService);
  final postRepository = PostRepositoryImpl(
    remoteDataSource: postRemoteDataSource,
  );
  runApp(MyApp(postRepository: postRepository));
}

class MyApp extends StatelessWidget {
  final PostRepositoryImpl postRepository;
  const MyApp({super.key, required this.postRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => PostBloc(
            getPosts: GetPosts(repository: postRepository),
            createPosts: CreatePosts(repository: postRepository),
            updatePosts: UpdatePosts(repository: postRepository),
            deletePosts: DeletePosts(repository: postRepository),
          ),
      child: MaterialApp(
        title: "A P I",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: PostPage(),
      ),
    );
  }
}
