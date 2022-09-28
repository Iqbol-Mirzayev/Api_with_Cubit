import 'package:api_with_cubit/views/home/state/main_state.dart';
import 'package:api_with_cubit/views/home/views/home/cubit/home_cubit.dart';
import 'package:api_with_cubit/views/home/views/home/state/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeErrorState) {
            debugPrint("Error State here");
            return;
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                "Home Page",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                ),
              ),
              centerTitle: true,
            ),
            body: Container(),
          );
        },
      ),
    );
  }
}
