import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Post/post_event.dart';
import 'package:flutter_bloc_practice/BLoC/Post/post_state.dart';
import 'package:flutter_bloc_practice/Repository/post_list_repo.dart';
import 'package:flutter_bloc_practice/Utils/status.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostListRepository postListRepository = PostListRepository();

  PostBloc() : super(PostState()) {
    on<FetchPost>(fetchPost);
  }

  void fetchPost(FetchPost event, Emitter<PostState> emit) async{
    await postListRepository
        .fetchPost()
        .then((value) {
          emit(
            state.copyWith(
              message: 'Success',
              postList: value,
              postStatus: Status.completed,
            ),
          );
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              message: error.toString(),
              postStatus: Status.failure,
            ),
          );
        });
  }
}
