import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/core/common/loader.dart';
import 'package:pet_rescues/core/constants/constants.dart';
import 'package:pet_rescues/core/constants/sign_in_button.dart';
import 'package:pet_rescues/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      body: isLoading
          ? const Loader()
          : Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 30, right: 30, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'Welcome to Pet Rescues !',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'We can\'t wait to help you find the newest member of your family!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 100),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        Constants.logoPath,
                        height: 150,
                      ),
                    ),
                  ),
                  // const SizedBox(height: 20),
                  const SignInButton(),
                ],
              ),
            ),
    );
  }
}
