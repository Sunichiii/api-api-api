import 'package:api_api/features/post/domain/entities/post.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  final bool isLoading;
  final List<Post> posts;
  final String message;
  const PostState({
    required this.isLoading,
    required this.posts,
    required this.message,
  });

  PostState copyWith({bool? isLoading, List<Post>? posts, String? message}) {
    return PostState(
      isLoading: isLoading ?? this.isLoading,
      posts: posts ?? this.posts,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [isLoading, posts, message];
}
