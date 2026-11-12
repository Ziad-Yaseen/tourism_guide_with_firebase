import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/app_colors.dart';
import '../cubits/auth/auth_cubit.dart';
import '../cubits/favourites/favourites_cubit.dart';
import 'explore_screen.dart';
import 'favoriate_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screenNum = 0;

  @override
  Widget build(BuildContext context) {
    var screens = [ExploreScreen(), FavoriateScreen()];

    return BlocListener<FavouritesCubit, FavouritesState>(
      listenWhen: (prev, curr) => curr.error != null,
      listener: (context, state) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(state.error!)));
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: const Text(
            "Tourism Egypt",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              tooltip: 'Log out',
              icon: const Icon(Icons.logout, color: Colors.white),
              onPressed: () => context.read<AuthCubit>().logout(),
            ),
          ],
        ),
        body: screens[screenNum],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: screenNum,
          onTap: (index) {
            setState(() {
              screenNum = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Explore"),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorites",
            ),
          ],
        ),
      ),
    );
  }
}
