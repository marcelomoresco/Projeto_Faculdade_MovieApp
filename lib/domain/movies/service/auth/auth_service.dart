import 'dart:io';

import 'auth_firebase_service.dart';

abstract class AuthService {
  Future<void> signUp(
    String email,
    String password,
  );

  Future<void> login(
    String email,
    String password,
  );
  Future<void> resetPassword(String email);

  Future<void> logout();

  factory AuthService() {
    return AuthFirebaseService();
  }
}
