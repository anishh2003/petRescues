import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/core/common/error_text.dart';
import 'package:pet_rescues/core/common/loader.dart';
import 'package:pet_rescues/features/auth/controller/auth_controller.dart';
import 'package:pet_rescues/firebase_options.dart';
import 'package:pet_rescues/models/user_model.dart';
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

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;

  void getData(WidgetRef ref, User data) async {
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => userModel);
    // setState(
    //     () {}); // had to put this in . Because authStateChangeProvider is not triggered again
  }

  @override
  Widget build(BuildContext context) {
    var darkThemeToggle = ref.watch(darkThemeProvider);
    var initialiseSettings = ref.watch(initialiseSettingsProvider);
    var readUserModel = ref.watch(userProvider);

    return MaterialApp(
      home: initialiseSettings.when(
        data: (data) => Scaffold(
          body: ref.watch(authStateChangeProvider).when(
                data: (data) => MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'Pet rescue App',
                  theme: lightMode,
                  darkTheme: darkMode,
                  themeMode: darkThemeToggle ? ThemeMode.dark : ThemeMode.light,
                  routerDelegate: RoutemasterDelegate(
                    routesBuilder: (context) {
                      if (data != null) {
                        getData(ref, data);
                        if (readUserModel != null) {
                          return loggedInRoute;
                        }
                      }
                      return loggedOutRoute;
                    },
                  ),
                  routeInformationParser: const RoutemasterParser(),
                ),
                error: (error, stackTrace) =>
                    ErrorText(error: error.toString()),
                loading: () => const Loader(),
              ),
        ),
        error: (error, stackTrace) => ErrorText(
            error: "Error encountered in fetching user preferences : $error"),
        loading: () {
          return MaterialApp(
            home: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          );
        },
      ),
    );
  }
}
