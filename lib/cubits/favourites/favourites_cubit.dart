import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(const FavouritesState());

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  StreamSubscription? _sub;
  String? _uid;

  CollectionReference<Map<String, dynamic>> _collection(String uid) {
    return _db.collection('users').doc(uid).collection('favourites');
  }

  void start(String uid) {
    _uid = uid;
    emit(const FavouritesState(loading: true));

    _sub?.cancel();
    _sub = _collection(uid).snapshots().listen(
      (snapshot) {
        final ids = snapshot.docs.map((doc) => doc.id).toSet();
        emit(FavouritesState(ids: ids));
      },
      onError: (_) {
        emit(const FavouritesState(error: 'Could not load favourites.'));
      },
    );
  }

  void stop() {
    _sub?.cancel();
    _uid = null;
    emit(const FavouritesState());
  }

  Future<void> toggle(String attractionId) async {
    if (_uid == null) return;

    final doc = _collection(_uid!).doc(attractionId);
    try {
      if (state.isFavourite(attractionId)) {
        await doc.delete();
      } else {
        await doc.set({'addedAt': FieldValue.serverTimestamp()});
      }
    } catch (_) {
      emit(
        FavouritesState(ids: state.ids, error: 'Could not update favourites.'),
      );
    }
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
