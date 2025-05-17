// import 'package:flutter/material.dart';
// import 'package:harmoniq/core/services/auth_service.dart';
// import 'package:harmoniq/core/widgets/user_avatar.dart';
// import 'package:harmoniq/features/home/widgets/home_app_bar.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final user = AuthService().currentUser;

//     return Scaffold(
//       appBar: const HomeAppBar(),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             UserAccountsDrawerHeader(
//               accountName: Text(user?.displayName ?? 'Guest'),
//               accountEmail: Text(user?.email ?? 'No email'),
//               currentAccountPicture: UserAvatar(user: user!),
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.primaryContainer,
//               ),
//             ),
//             const DrawerItem(title: 'Home', icon: Icons.home),
//             const DrawerItem(title: 'Profile', icon: Icons.person),
//             const DrawerItem(title: 'Messages', icon: Icons.message),
//             const DrawerItem(title: 'Notifications', icon: Icons.notifications),
//             const DrawerItem(title: 'Settings', icon: Icons.settings),
//             const DrawerItem(title: 'Help', icon: Icons.help),
//             const DrawerItem(title: 'Logout', icon: Icons.logout),
//           ],
//         ),
//       ),
//       body: const Center(child: Text('🎉 You are logged in!')),
//       bottomNavigationBar: BottomAppBar(
//         shape: const CircularNotchedRectangle(),
//         notchMargin: 6.0,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(icon: const Icon(Icons.home), onPressed: () {}),
//             IconButton(icon: const Icon(Icons.person), onPressed: () {}),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Placeholder action
//         },
//         child: const Icon(Icons.add),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }

// class DrawerItem extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   const DrawerItem({super.key, required this.title, required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Icon(icon),
//       title: Text(title),
//       onTap: () {
//         Navigator.pop(context);
//         // Implement navigation or action
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:harmoniq/core/services/auth_service.dart';
import 'package:harmoniq/core/services/local_auth/auth_gate.dart';
import 'package:harmoniq/core/widgets/user_avatar.dart';
import 'package:harmoniq/features/home/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService().currentUser;
    return AuthGate(
      child: Scaffold(
        appBar: const HomeAppBar(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(user?.displayName ?? 'Guest'),
                accountEmail: Text(user?.email ?? 'No email'),
                currentAccountPicture: UserAvatar(user: user!),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
              const DrawerItem(title: 'Home', icon: Icons.home),
              const DrawerItem(title: 'Profile', icon: Icons.person),
              const DrawerItem(title: 'Messages', icon: Icons.message),
              const DrawerItem(
                title: 'Notifications',
                icon: Icons.notifications,
              ),
              const DrawerItem(title: 'Settings', icon: Icons.settings),
              const DrawerItem(title: 'Help', icon: Icons.help),
              const DrawerItem(title: 'Logout', icon: Icons.logout),
            ],
          ),
        ),
        body: const Center(child: Text('🎉 You are logged in!')),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: const Icon(Icons.home), onPressed: () {}),
              IconButton(icon: const Icon(Icons.person), onPressed: () {}),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Placeholder action
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const DrawerItem({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        // Implement navigation or action
      },
    );
  }
}
