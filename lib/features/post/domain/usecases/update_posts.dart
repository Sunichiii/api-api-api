import 'package:api_api/features/post/domain/entities/post.dart';
import 'package:api_api/features/post/domain/repositories/post_repository.dart';

class UpdatePosts {
  final PostRepository repository;

  UpdatePosts({required this.repository});

  Future<Post> execute(int id, Map<String, dynamic> postData) async {
    return await repository.updatePost(id, postData);
  }
}
