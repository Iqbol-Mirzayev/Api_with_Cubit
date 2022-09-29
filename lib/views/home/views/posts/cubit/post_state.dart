import 'package:flutter/cupertino.dart';

@immutable
abstract class PostState {
  const PostState();
}

class PostInitialState extends PostState {
  const PostInitialState();
}

class PostCompletedState extends PostState {
  List data;

  PostCompletedState({required this.data});
}

class PostErrorState extends PostState {
  const PostErrorState();
}
