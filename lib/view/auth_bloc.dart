import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_29/repo/user_reoasitory.dart';
import 'package:flutter_application_29/view/auth_event.dart';
import 'package:flutter_application_29/view/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Authrepository _repo;

  AuthBloc({required Authrepository repo})
    : _repo = repo,
      super(AuthInitial()) {
    on<AuthStarted>(_onStarted);
    on<AuthSignInRequested>(_onSignIn);
    on<AuthSignUpRequested>(_onSignUp);
    on<AuthSignOutRequested>(_onSignOut);
  }

  Future<void> _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    await emit.forEach(
      _repo.authSateChange,
      onData: (user) =>
          user != null ? AuthAuthenticated(user) : AuthUnauthenticated(),
    );
  }

  Future<void> _onSignIn(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final user = await _repo.signIn(event.email, event.password);

      emit(AuthAuthenticated(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.code));
    }
  }

  Future<void> _onSignUp(
    AuthSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final user = await _repo.signUp(event.email, event.password);

      emit(AuthAuthenticated(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(_mapError(e.code)));
    }
  }

  Future<void> _onSignOut(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _repo.signOut();
  }

  String _mapError(String code) {
    return switch (code) {
      'user-not-fount' => 'Пользователь не найден',
      'wrong-password' => 'Неверный пароль',
      'email-already-in-use' => 'Email уже занят',
      'weak-password' => 'Слишком простой пароль',
      _ => 'Что-то пошло не так',
    };
  }
}
