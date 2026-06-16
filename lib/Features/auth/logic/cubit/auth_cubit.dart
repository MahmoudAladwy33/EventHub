import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/Core/networking/api_result.dart';

import '../../data/repos/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository;

  AuthCubit(this._repository) : super(const AuthInitial());

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());
    final result = await _repository.signUp(
      name: name,
      email: email,
      password: password,
    );
    
    result.when(
      success: (_) {
        emit(const AuthSuccess());
      },
      failure: (failure) {
        emit(AuthFailure(failure.message ?? 'Sign up failed'));
      },
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    emit(const AuthLoading());
    final result = await _repository.signIn(
      email: email,
      password: password,
      rememberMe: rememberMe,
    );
    
    result.when(
      success: (_) {
        emit(const AuthSuccess());
      },
      failure: (failure) {
        emit(AuthFailure(failure.message ?? 'Sign in failed'));
      },
    );
  }

  Future<void> signOut() async {
    await _repository.signOut();
    emit(const AuthInitial());
  }

  Future<String?> getUserName() async {
    return await _repository.getUserName();
  }

  Future<String?> getSavedEmail() async {
    return await _repository.getSavedEmail();
  }

  Future<String?> getSavedPassword() async {
    return await _repository.getSavedPassword();
  }
}
