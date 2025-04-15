import 'package:api_api/features/post/data/datasources/post_remote_data_source.dart';
import 'package:api_api/features/post/domain/entities/post.dart';
import 'package:api_api/features/post/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Post>> getPosts() async {
    // Fetching the list of PostModel
    final posts = await remoteDataSource.fetchPosts();
    // Mapping PostModel to Post entity
    return posts
        .map((post) => Post(id: post.id, title: post.title, body: post.body))
        .toList();
  }

  @override
  Future<Post> createPost(Map<String, dynamic> postData) async {
    // Create the post using the remote data source
    final postModel = await remoteDataSource.createPost(postData);
    // Access the PostModel's properties directly (no [] needed)
    return Post(
      id: postModel.id, // Accessing the property directly
      title: postModel.title, // Accessing the property directly
      body: postModel.body, // Accessing the property directly
    );
  }

  @override
  Future<Post> updatePost(int id, Map<String, dynamic> postData) async {
    // Update the post using the remote data source
    final postModel = await remoteDataSource.updatePost(id, postData);
    // Accessing the PostModel's properties directly (no [] needed)
    return Post(
      id: postModel.id, // Accessing the property directly
      title: postModel.title, // Accessing the property directly
      body: postModel.body, // Accessing the property directly
    );
  }

  @override
  Future<void> deletePost(int id) async {
    // Delete the post using the remote data source
    await remoteDataSource.deletePost(id);
  }
}
