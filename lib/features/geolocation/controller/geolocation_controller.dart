import 'package:flutter/material.dart';
import 'package:flutter_map_math/flutter_geo_math.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:pet_rescues/core/providers/common_provider.dart';
import 'package:pet_rescues/core/utils.dart';
import 'package:pet_rescues/features/filters/controller/filters_controller.dart';
import 'package:pet_rescues/features/geolocation/repository/geolocation_repository.dart';
import 'package:pet_rescues/models/pet_candidate_model.dart';

final currentPositionProvider = StateProvider<Position?>((ref) {
  return null;
});

final currentAdressProvider = StateProvider<String?>((ref) {
  return null;
});

final animalsInRadiusProvider = StateProvider<List<PetCandidateModel>>((ref) {
  return [];
});

final geoLocationControllerProvider =
    StateNotifierProvider<GeolocationController, bool>(
  (ref) => GeolocationController(
    geoLocationRepository: ref.watch(geoLocationRepositoryProvider),
    ref: ref,
  ),
);

class GeolocationController extends StateNotifier<bool> {
  final GeolocationRepository _geoLocationRepository;
  final Ref _ref;
  GeolocationController(
      {required GeolocationRepository geoLocationRepository, required Ref ref})
      : _geoLocationRepository = geoLocationRepository,
        _ref = ref,
        super(false); // loading

  Future<void> getCurrentPosition(BuildContext context) async {
    state = true;
    final userPermission =
        await _geoLocationRepository.handleLocationPermission();
    state = false;
    userPermission.fold((l) => showSnackBar(context, l.message), (r) async {
      final currentLocation = await _geoLocationRepository.getCurrentPosition();
      currentLocation.fold((l) => showSnackBar(context, l.message), (r) {
        showSnackBar(
          context,
          "Current position is : ${r.latitude}, ${r.longitude}",
        );
        //update the current position
        _ref.read(currentPositionProvider.notifier).update((state) => r);
      });
    });
  }

  Future<void> getAddressFromLatLng(
      BuildContext context, Position position) async {
    final placeAddress =
        await _geoLocationRepository.getAddressFromLatLng(position);
    placeAddress.fold(
        (l) => showSnackBar(context, l.message),
        (place) => _ref.read(currentAdressProvider.notifier).update((state) =>
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}'));
  }

  Future<void> getAnimalsListForSelectedDistancesFromCurrentCoordinates(
      BuildContext context, Position position) async {
    const double milesToMeters = 1609.34;
    List<double> distancesInMiles = [5, 10, 20, 50];
    List<String> distanceMessages = [];
    List<String> petsInDistanceMessages = [];
    final Distance distance = const Distance();
    FlutterMapMath path = FlutterMapMath();

    var petList = _ref.read(petListProvider);
    List<PetCandidateModel> filteredPets = [];
    var selectedUserRadiuses = _ref.read(appliedRadiusFilterProvider);
    List<double> radiusInDoublesFormat = selectedUserRadiuses
        .where((item) => item.checkboxValue == true)
        .map((item) => double.parse(item.title))
        .where((radius) => distancesInMiles.contains(radius))
        .toList();

    // Sort in descending order
    radiusInDoublesFormat.sort((a, b) => b.compareTo(a));

    if (radiusInDoublesFormat.isEmpty) {
      //TODO : logic done to get entire UK
      radiusInDoublesFormat.add(800);
    }

    final p1 = LatLng(position.latitude, position.longitude);

    double distanceInMeters = radiusInDoublesFormat.first * milesToMeters;

    final p2 = distance.offset(p1, distanceInMeters, 180);

    Function isInBoundary = path.createBoundary(p1, distanceInMeters);

    for (var item in petList) {
      List<Location> petLocation = await locationFromAddress(item.location!);
      LatLng petsLocation =
          LatLng(petLocation[0].latitude, petLocation[0].longitude);

      // Check if the pet's location is within the boundary
      bool isWithinBoundary = isInBoundary(petsLocation);

      // If the pet is within the boundary, add it to the filtered list
      if (isWithinBoundary) {
        item.distance = path.distanceBetween(p1.latitude, p1.longitude,
            petsLocation.latitude, petsLocation.longitude, "miles");

        filteredPets.add(item);
      }
    }
    // _ref.read(petListProvider).where((item) => item.id != null);
//  _ref.read(petListProvider).
    _ref.read(animalsInRadiusProvider.notifier).update((state) => filteredPets);

    distanceMessages
        .add('Latlang of ${radiusInDoublesFormat.first} miles is $p2');
    petsInDistanceMessages.add(
        'Number of pets in the vicinity of ${radiusInDoublesFormat.first} is :${filteredPets.length}');

    for (var message in distanceMessages) {
      debugPrint(message); // Print the distance messages in the console
    }

    for (var message in petsInDistanceMessages) {
      debugPrint(
          message); // Print the number of pets in the distance to the console
    }

    //TODO : check if you still want this logic in the end.
    String distMessage = distanceMessages.join("\n");
    _ref.read(currentAdressProvider.notifier).update((state) => distMessage);
  }

  //   final placeAddress =
  //       await _geoLocationRepository.getAnimalsForSelectedDistancesFromCurrentCoordinates(position);
  //   placeAddress.fold(
  //       (l) => showSnackBar(context, l.message),
  //       (place) => _ref.read(currentAdressProvider.notifier).update((state) =>
  //           '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}'));
  // }
}
