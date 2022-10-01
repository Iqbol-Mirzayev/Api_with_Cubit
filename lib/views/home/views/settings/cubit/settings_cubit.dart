import 'package:api_with_cubit/views/home/views/home/cubit/home_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsInitial());

  Set temp = {};

  searchData(String text) {
    debugPrint("GLOBAL LENGTH ${HomeCubit.globalData.length}");
    temp.clear();
    emit(const SettingsInitial());
    for (var i = 0; i < HomeCubit.globalData.length; i++) {
      if (text.isEmpty) {
        temp.clear();
        emit(const SettingsInitial());
      } else if (HomeCubit.globalData[i]['attributes']['name']
          .toString()
          .toLowerCase()
          .contains(text.toString().toLowerCase())) {
        temp.add(HomeCubit.globalData[i]['attributes']);
        debugPrint('LENGTH ${temp.length.toString()}');
        emit(const SettingsInitial());
      }
    }
  }
}
