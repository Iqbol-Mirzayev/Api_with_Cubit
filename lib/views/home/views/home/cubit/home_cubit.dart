import 'package:api_with_cubit/core/constants/apiBase.dart';
import 'package:api_with_cubit/views/home/views/home/cubit/home_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(const HomeInitialState());

  List<dynamic> globalData = [];

  Future getData() async {
    try {
      Response res = await Dio().get(ApiBase.instance.users);
      if (res.statusCode == 200) {
        globalData = res.data;
   
        emit(
          HomeCompletedState(data: globalData),
        );
      } else {
        emit(const HomeErrorState());
      }
    } catch (e) {
      emit(const HomeErrorState());
      debugPrint(e.toString());
    }
  }
}
