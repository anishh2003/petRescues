import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/features/auth/controller/auth_controller.dart';
import 'package:pet_rescues/settings/theme_provider.dart';
import 'package:routemaster/routemaster.dart';

class ProfileDrawer extends ConsumerWidget {
  const ProfileDrawer({super.key});

  void logOut(WidgetRef ref) {
    ref.read(authControllerProvider.notifier).logout();
  }

  void navigateToUserProfile(BuildContext context, String uid) {
    Routemaster.of(context).push('/u/$uid');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    var darkTheme = ref.watch(darkThemeProvider);
    var darkThemetoggleValue = ref.watch(usersSettingsProvider);

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.profilePic),
              radius: 70,
            ),
            const SizedBox(height: 10),
            Text(
              user.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            const Divider(),
            ListTile(
              title: Text(
                'My Profile',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              leading: const Icon(Icons.person),
              onTap: () => navigateToUserProfile(context, user.uid),
            ),
            ListTile(
              title: Text(
                'Log Out',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              onTap: () => logOut(ref),
            ),
            ListTile(
              title: Text(
                "Dark theme",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              leading: Icon(
                Icons.sunny,
                color: darkTheme
                    ? Theme.of(context).colorScheme.primary
                    : Colors.yellow,
              ),
              trailing: Switch.adaptive(
                value: darkTheme,
                onChanged: (bool value) async {
                  ref.read(darkThemeProvider.notifier).update((state) => value);
                  await darkThemetoggleValue.setUsersThemeSettings(value);
                },
              ),
              onTap: () => logOut(ref),
            ),
          ],
        ),
      ),
    );
  }
}