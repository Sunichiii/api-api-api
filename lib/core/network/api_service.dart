import 'api_client.dart';

class ApiService {
  final ApiClient apiClient;

  ApiService({required this.apiClient});

  Future<dynamic> fetchPosts() async {
    final response = await apiClient.get('/posts');
    return response.data;
  }

  Future<dynamic> createPosts(Map<String, dynamic> postData) async {
    final response = await apiClient.post('/posts', postData);
    return response.data;
  }

  Future<dynamic> updatePosts(int id, Map<String, dynamic> postData) async {
    final response = await apiClient.put('/posts/$id', postData);
    return response.data;
  }

  Future<dynamic> deletePosts(int id) async {
    final response = await apiClient.delete('/posts/$id');
    return response.data;
  }
}
