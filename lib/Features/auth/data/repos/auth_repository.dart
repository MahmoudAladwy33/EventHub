import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Core/errors/app_failure.dart';
import '../../../../Core/networking/api_result.dart';

abstract class AuthRepository {
  Future<ApiResult<void>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<ApiResult<void>> signIn({
    required String email,
    required String password,
    required bool rememberMe,
  });

  Future<bool> isLoggedIn();
  Future<String?> getUserName();
  Future<String?> getSavedEmail();
  Future<String?> getSavedPassword();
  Future<bool> getRememberMe();
  Future<void> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;

  AuthRepositoryImpl(this._prefs, this._secureStorage);

  @override
  Future<ApiResult<void>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      await _prefs.setString('user_name', name);
      await _prefs.setString('user_email', email);
      await _secureStorage.write(key: 'user_password', value: password);
      
      return const ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(AppFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<void>> signIn({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final savedEmail = _prefs.getString('user_email');
      final savedPassword = await _secureStorage.read(key: 'user_password');
      if (savedEmail == email && savedPassword == password) {
        await _prefs.setBool('remember_me', rememberMe);
        if (rememberMe) {
          await _prefs.setBool('is_logged_in', true);
        }
        return const ApiResult.success(null);
      } else {
        return const ApiResult.failure(AppFailure('Invalid email or password'));
      }
    } catch (e) {
      return ApiResult.failure(AppFailure(e.toString()));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    return _prefs.getBool('is_logged_in') ?? false;
  }

  @override
  Future<String?> getUserName() async {
    return _prefs.getString('user_name');
  }

  @override
  Future<String?> getSavedEmail() async {
    return _prefs.getString('user_email');
  }

  @override
  Future<String?> getSavedPassword() async {
    return await _secureStorage.read(key: 'user_password');
  }

  @override
  Future<bool> getRememberMe() async {
    return _prefs.getBool('remember_me') ?? false;
  }

  @override
  Future<void> signOut() async {
    await _prefs.setBool('is_logged_in', false);
  }
}
