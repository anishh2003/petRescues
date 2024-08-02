import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/core/providers/settings_provider.dart';

final darkThemeProvider = StateProvider<bool>((ref) {
  return false;
});

// final initialiseSettingsProvider = FutureProvider<void>((ref) async {
//   UsersSettings userSettings = ref.read(usersSettingsProvider);
//   await userSettings.initialiseSettings();
//   ref
//       .read(darkThemeProvider.notifier)
//       .update((state) => userSettings.getUsersThemeSettings());
// });
