import 'package:api_with_cubit/core/constants/apiBase.dart';
import 'package:api_with_cubit/views/home/views/home/cubit/home_state.dart';
import 'package:api_with_cubit/views/home/views/posts/cubit/post_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(const PostInitialState());

  List<dynamic> postData = [];

  Future getData() async {
    try {
      Response res = await Dio().get(ApiBase.instance.posts);

      if (res.statusCode == 200) {
        postData = res.data;

        emit(PostCompletedState(data: postData));
      } else {
        emit(const PostErrorState());
      }
    } catch (e) {
      emit(const PostErrorState());
      
    }
  }
}
