import 'package:api_api/features/post/domain/entities/post.dart';
import 'package:api_api/features/post/domain/repositories/post_repository.dart';

class CreatePosts {
  final PostRepository repository;
  CreatePosts({required this.repository});

  Future<Post> execute(Map<String, dynamic> postData) async {
    return await repository.createPost(postData);
  }
}
