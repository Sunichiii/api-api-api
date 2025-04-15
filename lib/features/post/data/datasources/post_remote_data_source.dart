import 'package:api_api/core/network/api_service.dart';
import 'package:api_api/features/post/data/models/post_model.dart';

class PostRemoteDataSource {
  final ApiService apiService;

  PostRemoteDataSource({required this.apiService});

  // Fetch all posts
  Future<List<PostModel>> fetchPosts() async {
    final response = await apiService.fetchPosts();
    return (response as List).map((data) => PostModel.fromJson(data)).toList();
  }

  // Create a new post
  Future<PostModel> createPost(Map<String, dynamic> postData) async {
    final response = await apiService.createPosts(postData);
    return PostModel.fromJson(response);
  }

  // Update an existing post
  Future<PostModel> updatePost(int id, Map<String, dynamic> postData) async {
    final response = await apiService.updatePosts(id, postData);
    return PostModel.fromJson(response);
  }

  // Delete a post
  Future<void> deletePost(int id) async {
    await apiService.deletePosts(id);
  }
}
