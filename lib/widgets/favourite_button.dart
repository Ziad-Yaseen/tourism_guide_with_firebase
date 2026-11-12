import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/favourites/favourites_cubit.dart';

class FavouriteButton extends StatelessWidget {
  final String attractionId;

  const FavouriteButton({super.key, required this.attractionId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      buildWhen: (prev, curr) =>
          prev.isFavourite(attractionId) != curr.isFavourite(attractionId),
      builder: (context, state) {
        final isFav = state.isFavourite(attractionId);
        return IconButton(
          tooltip: isFav ? 'Remove from favourites' : 'Add to favourites',
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: isFav ? Colors.red : null,
          ),
          onPressed: () => context.read<FavouritesCubit>().toggle(attractionId),
        );
      },
    );
  }
}
