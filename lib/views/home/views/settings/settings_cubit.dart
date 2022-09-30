import 'package:api_with_cubit/views/home/cubit/main_state.dart';
import 'package:api_with_cubit/views/home/views/home/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  Set temp = {};

  searchData(String text) {
    debugPrint("Global Length : ${HomeCubit.globalData.length}");
    temp.clear();
    emit(SettingsInitial());
    for (var i = 0; i < HomeCubit.globalData.length; i++) {
      if (text.isEmpty) {
        temp.clear();
        emit(SettingsInitial());
      }else if{HomeCubit.globalData[i]["atributes"]["name"]
      .toString().toLowerCase().contains(text.toString().toLowerCase());
      
      temp.add(HomeCubit().globalData[i]["atributes"]);
      emit(SettingsInitial());
      }
    }
  }
}
