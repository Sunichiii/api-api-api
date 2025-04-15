import 'package:api_api/features/post/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
  Future<Post> createPost(Map<String, dynamic> postData);
  Future<Post> updatePost(int id, Map<String, dynamic> postData);
  Future<void> deletePost(int id);
}
