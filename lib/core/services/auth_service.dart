import 'package:firebase_auth/firebase_auth.dart';
import 'package:harmoniq/core/models/auth_user_model.dart';
import 'package:harmoniq/core/contracts/i_auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService implements IAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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

  @override
  Future<AuthUserModel?> registerWithEmail(
    String email,
    String password,
  ) async {
    final result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
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
  Future<void> signOut() => _auth.signOut();

  @override
  AuthUserModel? get currentUser {
    final user = _auth.currentUser;
    return user != null ? AuthUserModel.fromFirebaseUser(user) : null;
  }

  @override
  Stream<AuthUserModel?> get authStateChanges {
    return _auth.authStateChanges().map(
      (user) => user != null ? AuthUserModel.fromFirebaseUser(user) : null,
    );
  }
}
