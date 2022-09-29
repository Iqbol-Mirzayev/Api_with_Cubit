import 'package:api_with_cubit/views/home/cubit/main_cubit.dart';
import 'package:api_with_cubit/views/home/views/main_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: CupertinoColors.quaternarySystemFill,
          brightness: Brightness.light,
        ),
      ),
      home: BlocProvider(
        create: (context) => MainCubit(),
        child: const MainView(),
      ),
    );
  }
}
