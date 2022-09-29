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
            body: BlocBuilder<HomeCubit, HomeStates>(
              builder: (context, state) {
                if (state is HomeInitialState) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is HomeCompletedState) {
                  state.data;
                  debugPrint(state.data.toString());
                  return ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          subtitle: Text(
                            state.data[index]["email"],
                          ),
                          title: Text(
                            state.data[index]["name"],
                          ),
                          selected: true,
                          selectedColor: Colors.green,
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  actions: [
                                    Center(
                                      child: Text(
                                        "Nothing Not Here",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("Internet kemayapti"),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
