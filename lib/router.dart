import 'package:flutter/material.dart';
import 'package:pet_rescues/features/auth/screens/login_screen.dart';
import 'package:pet_rescues/features/filters/screens/filters_screen.dart';
import 'package:pet_rescues/features/geolocation/geolocation.dart';
import 'package:pet_rescues/features/home/screens/home_screen.dart';
import 'package:pet_rescues/features/pets/pets_details_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
  '/pets/:petId': (routeData) => MaterialPage(
        child: PetDetailsScreen(
          petId: routeData.pathParameters['petId']!,
        ),
      ),
  '/filters': (_) => const MaterialPage(child: FiltersScreen()),
  '/location': (_) => const MaterialPage(child: LocationPage()),
});

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});
