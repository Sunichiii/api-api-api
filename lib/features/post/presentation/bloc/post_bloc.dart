import 'package:api_api/features/post/presentation/bloc/post_event.dart';
import 'package:api_api/features/post/presentation/bloc/post_state.dart';
import 'package:bloc/bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPosts getPosts;
  final CreatePosts createPosts;
  final UpdatePosts updatePosts;
  final DeletePosts deletePosts;

  PostBloc({
    required this.getPosts,
    required this.createPosts,
    required this.updatePosts,
    required this.deletePosts,
  }) : super(PostState(isLoading: false, posts: [], message: ''));
}
