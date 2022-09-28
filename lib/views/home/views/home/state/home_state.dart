import 'package:flutter/cupertino.dart';

@immutable
abstract class HomeStates {
  const HomeStates();
}

class HomeInitialState extends HomeStates{
 const HomeInitialState();
}

class HomeCompletedState extends HomeStates{
  const HomeCompletedState();
}
