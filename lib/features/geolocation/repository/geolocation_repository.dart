import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:pet_rescues/core/failure.dart';
import 'package:pet_rescues/core/type_defs.dart';
import 'package:pet_rescues/models/pet_candidate_model.dart';

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

  FutureEither<Placemark> getAddressFromLatLng(Position position) async {
    List<Placemark> placemarks = [];
    try {
      placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      return right(place);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  // FutureEither<Placemark> getAnimalsForSelectedDistancesFromCurrentCoordinates(
  //     Position position) async {
  // const double milesToMeters = 1609.34;
  // List<double> distancesInMiles = [5, 10, 20, 50];
  // List<String> distanceMessages = [];
  // List<String> petsInDistanceMessages = [];
  // final Distance distance = const Distance();

  // var petList = ref.read(petListProvider);
  // List<PetCandidateModel> filteredPets = [];
  // var selectedUserRadiuses = ref.read(appliedRadiusFilterProvider);
  // List<double> radiusInDoublesFormat = selectedUserRadiuses
  //     .where((item) => item.checkboxValue == true)
  //     .map((item) => double.parse(item.title))
  //     .where((radius) => distancesInMiles.contains(radius))
  //     .toList();

  // // Sort in descending order
  // radiusInDoublesFormat.sort((a, b) => b.compareTo(a));

  // if (radiusInDoublesFormat.isEmpty) {
  //   //TODO : logic done to get entire UK
  //   radiusInDoublesFormat.add(800);
  // }

  //   final p1 = LatLng(position.latitude, position.longitude);

  //   double distanceInMeters = radiusInDoublesFormat.first * milesToMeters;

  //   final p2 = distance.offset(p1, distanceInMeters, 180);

  //   Function isInBoundary = path.createBoundary(p1, distanceInMeters);

  //   for (var item in petList) {
  //     List<Location> petLocation = await locationFromAddress(item.location!);
  //     LatLng petsLocation =
  //         LatLng(petLocation[0].latitude, petLocation[0].longitude);

  //     // Check if the pet's location is within the boundary
  //     bool isWithinBoundary = isInBoundary(petsLocation);

  //     // If the pet is within the boundary, add it to the filtered list
  //     if (isWithinBoundary) {
  //       filteredPets.add(item);
  //     }
  //   }

  //   distanceMessages
  //       .add('Latlang of ${radiusInDoublesFormat.first} miles is $p2');
  //   petsInDistanceMessages.add(
  //       'Number of pets in the vicinity of ${radiusInDoublesFormat.first} is :${filteredPets.length}');

  //   for (var message in distanceMessages) {
  //     debugPrint(message); // Print the distance messages in the console
  //   }

  //   for (var message in petsInDistanceMessages) {
  //     debugPrint(
  //         message); // Print the number of pets in the distance to the console
  //   }

  //   //TODO : check if you still want this logic in the end.
  //   String distMessage = distanceMessages.join("\n");
  //   ref.read(currentAdressProvider.notifier).update((state) => distMessage);
  // }
}
