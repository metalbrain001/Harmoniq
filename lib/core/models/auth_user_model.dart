class AuthUserModel {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoURL;

  const AuthUserModel({
    required this.uid,
    this.email,
    this.displayName,
    this.photoURL,
  });

  factory AuthUserModel.fromFirebaseUser(dynamic user) {
    return AuthUserModel(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoURL: user.photoURL,
    );
  }

  @override
  String toString() => 'AuthUserModel(uid: $uid, email: $email)';
}
