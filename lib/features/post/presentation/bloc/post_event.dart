import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

class FetchPostEvent extends PostEvent {}

class CreatePostEvent extends PostEvent {
  final Map<String, dynamic> postData;
  const CreatePostEvent({required this.postData});
}

class UpdatePostEvent extends PostEvent {
  final int id;
  final Map<String, dynamic> postData;
  const UpdatePostEvent({required this.id, required this.postData});
}

class DeletePostEvent extends PostEvent {
  final int id;
  const DeletePostEvent({required this.id});
}
