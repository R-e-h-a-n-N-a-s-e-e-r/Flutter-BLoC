import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practice/Models/PostModel.dart';
import 'package:flutter_bloc_practice/Utils/status.dart';

class PostState extends Equatable {
  final Status postStatus;
  final List<PostModel> postList;
  final String message;

  const PostState({
    this.postStatus = Status.loading,
    this.postList = const <PostModel>[],
    this.message = '',
  });

  PostState copyWith({
    Status? postStatus,
    List<PostModel>? postList,
    String? message,
  }) {
    return PostState(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [postStatus, postList, message];
}
