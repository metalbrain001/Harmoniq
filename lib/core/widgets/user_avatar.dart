import 'package:flutter/material.dart';
import 'package:harmoniq/core/models/auth_user_model.dart';

class UserAvatar extends StatelessWidget {
  final AuthUserModel user;
  final double size;

  const UserAvatar({super.key, required this.user, this.size = 40});

  @override
  Widget build(BuildContext context) {
    if (user.photoURL != null && user.photoURL!.isNotEmpty) {
      return CircleAvatar(
        radius: size / 2,
        backgroundImage: NetworkImage(user.photoURL!),
      );
    }

    return CircleAvatar(
      radius: size / 2,
      child: Text(
        (user.displayName?.substring(0, 1).toUpperCase() ?? '?'),
        style: TextStyle(fontSize: size / 2),
      ),
    );
  }
}
