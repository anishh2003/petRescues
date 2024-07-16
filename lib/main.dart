import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/firebase_options.dart';
import 'package:pet_rescues/router.dart';
import 'package:pet_rescues/settings/theme_data.dart';
import 'package:pet_rescues/settings/theme_provider.dart';
import 'package:routemaster/routemaster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkThemeToggle = ref.watch(darkThemeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Pet rescue App ',
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: darkThemeToggle ? ThemeMode.dark : ThemeMode.light,
      routerDelegate: RoutemasterDelegate(
        routesBuilder: (context) {
          // if (data != null) {
          //   getData(ref, data);
          //   if (userModel != null) {
          //     return loggedInRoute;
          //   }
          // }
          return loggedOutRoute;
        },
      ),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
