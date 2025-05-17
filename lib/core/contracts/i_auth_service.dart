// Project: Harmoniq
import 'package:flutter/material.dart';
import 'package:harmoniq/core/models/auth_user_model.dart';

abstract class IAuthService {
  Future<AuthUserModel?> loginWithEmail(String email, String password);
  Future<AuthUserModel?> registerWithEmail(String email, String password);
  Future<void> signOut(BuildContext context);
  AuthUserModel? get currentUser;
  Stream<AuthUserModel?> get authStateChanges;
}
