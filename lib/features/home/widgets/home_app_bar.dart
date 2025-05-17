import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoniq/core/services/auth_service.dart';
import 'package:harmoniq/core/theme/app_colors.dart';
import 'package:harmoniq/core/widgets/theme_toggle_button.dart';
import 'package:harmoniq/helper/enum/app_enum.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, this.context});
  final BuildContext? context;

  void _logout(BuildContext context) async {
    await AuthService().signOut(context);
    if (context.mounted) context.goNamed(AppRoute.welcomeBack.name);
  }

  void _openNotifications(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => const AlertDialog(
            title: Text('Notifications'),
            content: Text('You have no new notifications'),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarBackground,
      leading: Builder(
        builder:
            (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
      ),
      centerTitle: true,
      title: const Text('Home', style: TextStyle(fontWeight: FontWeight.w600)),
      actions: [
        const ThemeToggleButton(),
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () => _openNotifications(context),
        ),
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => _logout(context),
          tooltip: 'Logout',

          // navigate to welcomeback screen
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
