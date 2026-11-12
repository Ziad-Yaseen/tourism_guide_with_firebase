import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    checkUser();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void checkUser() {
    final user = _auth.currentUser;
    if (user == null) {
      emit(AuthUnauthenticated());
    } else {
      emit(AuthAuthenticated(user));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      emit(AuthAuthenticated(result.user!));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_errorMessage(e.code)));
    }
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      await result.user!.updateDisplayName(name.trim());
      emit(AuthAuthenticated(_auth.currentUser!));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_errorMessage(e.code)));
    }
  }

  Future<void> sendPasswordReset(String email) async {
    emit(AuthLoading());
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      emit(AuthPasswordResetSent());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_errorMessage(e.code)));
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    emit(AuthUnauthenticated());
  }

  Future<String?> getIdToken() async {
    return await _auth.currentUser?.getIdToken();
  }

  String _errorMessage(String code) {
    switch (code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'Incorrect email or password.';
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'weak-password':
        return 'Password is too weak (min 6 characters).';
      case 'network-request-failed':
        return 'No internet connection.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }
}
