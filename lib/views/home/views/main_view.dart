import 'package:api_with_cubit/views/home/cubit/main_cubit.dart';
import 'package:api_with_cubit/views/home/state/main_state.dart';
import 'package:api_with_cubit/views/home/views/home/view/home_view.dart';
import 'package:api_with_cubit/views/home/views/posts/view/post_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainCubit, MainState>(
        builder: (contextcubit, state) {
          if (state is EcoState) {
            return const Center(
              child: Text("Eco page"),
            );
          } else if (state is HomeState) {
            return const HomeView();
          } else if (state is SettingsState) {
            return const PostView();
          } else {
            return const Center(
              child: Text("Profile Page"),
            );
          }
        },
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: CupertinoColors.systemGreen,
        ),
        child: NavigationBar(
          backgroundColor: CupertinoColors.quaternarySystemFill,
          elevation: 0,
          animationDuration: const Duration(seconds: 0),
          selectedIndex: context.watch<MainCubit>().currentPage,
          onDestinationSelected: (v) {
            context.read<MainCubit>().changeState(v);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.newspaper),
              label: "News",
              selectedIcon: Icon(Icons.newspaper),
            ),
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home",
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              icon: Icon(Icons.post_add),
              label: "Posts",
              selectedIcon: Icon(Icons.post_add),
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: "Profile",
              selectedIcon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
