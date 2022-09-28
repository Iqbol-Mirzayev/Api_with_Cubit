import 'package:api_with_cubit/views/home/cubit/main_cubit.dart';
import 'package:api_with_cubit/views/home/state/main_state.dart';
import 'package:api_with_cubit/views/home/views/home/view/home_view.dart';
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
            return const Center(
              child: Text("Settings Page"),
            );
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
              icon: Icon(Icons.eco_outlined),
              label: "Eco",
              selectedIcon: Icon(Icons.eco_outlined),
            ),
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home",
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: "Settings",
              selectedIcon: Icon(Icons.settings),
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
