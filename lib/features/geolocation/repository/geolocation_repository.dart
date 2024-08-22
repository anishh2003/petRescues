import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pet_rescues/core/failure.dart';
import 'package:pet_rescues/core/type_defs.dart';

final geoLocationRepositoryProvider = Provider(
  (ref) => GeolocationRepository(),
);

class GeolocationRepository {
  FutureEither<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return left(Failure(
            'Location services are disabled. Please enable the services.'));
        // return false;
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return left(Failure('Location permissions are denied.'));
          // return false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return left(Failure(
            'Location permissions are permanently denied, we cannot request permissions.'));
      }
      // return true;
      return right(true);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<Position> getCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return right(position);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
