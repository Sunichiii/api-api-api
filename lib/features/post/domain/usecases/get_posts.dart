import 'package:api_api/features/post/domain/entities/post.dart';
import 'package:api_api/features/post/domain/repositories/post_repository.dart';

class GetPosts {
  final PostRepository repository;
  GetPosts({required this.repository});

  Future<List<Post>> execute() async {
    return await repository.getPosts();
  }
}
