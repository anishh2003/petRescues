import 'package:flutter/material.dart';
import 'package:pet_rescues/features/auth/screens/login_screen.dart';
import 'package:pet_rescues/features/home/screens/home_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
});

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});
