part of 'favourites_cubit.dart';

class FavouritesState extends Equatable {
  final Set<String> ids;
  final bool loading;
  final String? error;

  const FavouritesState({
    this.ids = const {},
    this.loading = false,
    this.error,
  });

  bool isFavourite(String id) => ids.contains(id);

  @override
  List<Object?> get props => [ids, loading, error];
}
