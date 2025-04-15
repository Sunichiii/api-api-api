import 'package:api_api/features/post/domain/usecases/create_posts.dart';
import 'package:api_api/features/post/domain/usecases/delete_posts.dart';
import 'package:api_api/features/post/domain/usecases/get_posts.dart';
import 'package:api_api/features/post/domain/usecases/update_posts.dart';
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
  }) : super(PostState(isLoading: false, posts: [], message: '')) {
    on<FetchPostEvent>(_onFetchPosts);
    on<CreatePostEvent>(_onCreatePosts);
    on<UpdatePostEvent>(_onUpdatePosts);
    on<DeletePostEvent>(_onDeletePosts);
  }

  Future<void> _onFetchPosts(
    FetchPostEvent event,
    Emitter<PostState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final posts = await getPosts.execute();
      emit(state.copyWith(isLoading: false, posts: posts));
    } catch (e) {
      emit(state.copyWith(isLoading: false, message: "Failed to fetch posts"));
    }
  }

  Future<void> _onCreatePosts(
    CreatePostEvent event,
    Emitter<PostState> emit,
  ) async {
    try {
      await createPosts.execute(event.postData);
      add(FetchPostEvent());
    } catch (e) {
      emit(state.copyWith(message: "Failed to create posts"));
    }
  }

  Future<void> _onUpdatePosts(
    UpdatePostEvent event,
    Emitter<PostState> emit,
  ) async {
    try {
      await updatePosts.execute(event.id, event.postData);
      add(FetchPostEvent());
    } catch (e) {
      emit(state.copyWith(message: "Failed to upadte the posts"));
    }
  }

  Future<void> _onDeletePosts(
    DeletePostEvent event,
    Emitter<PostState> emit,
  ) async {
    try {
      await deletePosts.execute(event.id);
      add(FetchPostEvent());
    } catch (e) {
      emit(state.copyWith(message: "Failed to delete post"));
    }
  }
}
