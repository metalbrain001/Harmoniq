import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harmoniq/core/models/auth_user_model.dart';
import 'package:harmoniq/core/contracts/i_auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:harmoniq/core/services/log_service.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:harmoniq/core/services/local_auth/local_auth_service.dart';

class AuthService implements IAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final LocalAuthService _localAuth = LocalAuthService();

  // authStateChanges
  FirebaseAuth get auth => _auth;
  GoogleSignIn get googleSignIn => _googleSignIn;

  Future<bool> canUseBiometric() async {
    final auth = LocalAuthentication();
    final canCheckBiometrics = await auth.canCheckBiometrics;
    final isDeviceSupported = await auth.isDeviceSupported();
    final available = await auth.getAvailableBiometrics();

    return canCheckBiometrics && isDeviceSupported && available.isNotEmpty;
  }

  // Call this from UI or flows where biometric auth is needed
  Future<bool> authenticateWithBiometrics() async {
    return await _localAuth.authenticateWithBiometrics(
      reason: 'Please authenticate to continue',
    );
  }

  // ✅ Anonymous Sign-In
  Future<AuthUserModel?> signInAnonymously() async {
    try {
      final result = await _auth.signInAnonymously();
      return AuthUserModel.fromFirebaseUser(result.user);
    } catch (e) {
      rethrow;
    }
  }

  // ✅ Google Sign-In
  Future<AuthUserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final result = await _auth.signInWithCredential(credential);
      return AuthUserModel.fromFirebaseUser(result.user);
    } catch (e) {
      rethrow;
    }
  }

  // ✅ Google Sign-Out
  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  // Sign In with Apple
  Future<AuthUserModel?> signInWithApple({
    List<AppleIDAuthorizationScopes> scopes = const [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
  }) async {
    try {
      final rawNonce = _generateNonce();
      final hashedNonce = _sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: scopes,
        nonce: hashedNonce,
      );

      final identityToken = appleCredential.identityToken;
      final authorizationCode = appleCredential.authorizationCode;
      LogService.d('Apple Sign-In identityToken: $identityToken');
      LogService.d('Apple Sign-In authorizationCode: $authorizationCode');

      if (identityToken == null) {
        LogService.e(
          '❌ Apple Sign-In: identityToken or authorizationCode is null',
        );
        return null;
      }

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
        rawNonce: rawNonce,
      );
      LogService.d('Apple Sign-In OAuth credential: $oauthCredential');

      final result = await _auth.signInWithCredential(oauthCredential);
      if (result.user == null) {
        LogService.e('❌ Apple Sign-In: User is null');
        return null;
      }
      if (result.additionalUserInfo?.isNewUser == true) {
        LogService.d('Apple Sign-In: New user created');
      } else {
        LogService.d('Apple Sign-In: Existing user signed in');
      }
      LogService.d('Apple Sign-In successful: ${result.user?.email}');
      return AuthUserModel.fromFirebaseUser(result.user);
    } catch (e) {
      LogService.e('❌ Apple Sign-In failed: $e');
      return null;
    }
  }

  String _generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // Sign In with Twitter
  Future<AuthUserModel?> signInWithTwitter() async {
    try {
      // ✅ Use FirebaseAuth's built-in Twitter provider
      final twitterProvider = TwitterAuthProvider();

      final userCredential = await FirebaseAuth.instance.signInWithProvider(
        twitterProvider,
      );

      LogService.d(
        '🐦 Twitter Sign-In successful: ${userCredential.user?.email}',
      );

      return AuthUserModel.fromFirebaseUser(userCredential.user);
    } catch (e) {
      LogService.e('❌ Twitter Sign-In failed: $e');
      return null;
    }
  }

  @override
  Future<AuthUserModel?> registerWithEmail(
    String email,
    String password,
  ) async {
    final result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (result.user == null) {
      LogService.d('User registration failed');
      return null;
    }
    LogService.d('User registered with email: $email');
    return result.user != null
        ? AuthUserModel.fromFirebaseUser(result.user)
        : null;
  }

  @override
  Future<AuthUserModel?> loginWithEmail(String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user != null
        ? AuthUserModel.fromFirebaseUser(result.user)
        : null;
  }

  @override
  // Future<void> signOut() => _auth.signOut();
  Future<void> signOut(BuildContext context) async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  @override
  AuthUserModel? get currentUser {
    final user = _auth.currentUser;
    return user != null ? AuthUserModel.fromFirebaseUser(user) : null;
  }

  // Local Authentication(Biomentrics)

  @override
  Stream<AuthUserModel?> get authStateChanges {
    return _auth.authStateChanges().map(
      (user) => user != null ? AuthUserModel.fromFirebaseUser(user) : null,
    );
  }
}
