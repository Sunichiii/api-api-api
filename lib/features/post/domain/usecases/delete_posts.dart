import 'package:api_api/features/post/domain/repositories/post_repository.dart';

class DeletePosts {
  final PostRepository repository;

  DeletePosts({required this.repository});

  Future<void> execute(int id) async {
    await repository.deletePost(id);
  }
}
