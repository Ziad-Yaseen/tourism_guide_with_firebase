import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/favourites/favourites_cubit.dart';
import '../data/attractions_data.dart';
import '../widgets/attraction_card.dart';

class FavoriateScreen extends StatelessWidget {
  const FavoriateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        if (state.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        final favourites = attractions
            .where((a) => state.isFavourite(a.id))
            .toList();

        if (favourites.isEmpty) {
          return const Center(
            child: Text("No favourites yet.\nTap the heart on any place."),
          );
        }

        return ListView.builder(
          itemCount: favourites.length,
          itemBuilder: (context, index) {
            return AttractionCard(attraction: favourites[index]);
          },
        );
      },
    );
  }
}
