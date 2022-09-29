import 'package:flutter/cupertino.dart';

@immutable

abstract class NewsState {
  const NewsState();
}

class NewsInitialState extends NewsState {
  const NewsInitialState();
}

class NewsCompletedState extends NewsState {
  const NewsCompletedState();
}

class NewsErrorState extends NewsState {
  const NewsErrorState();
}
