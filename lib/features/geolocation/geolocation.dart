import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_math/flutter_geo_math.dart';
import 'package:pet_rescues/core/providers/common_provider.dart';
import 'package:pet_rescues/features/filters/controller/filters_controller.dart';
import 'package:pet_rescues/models/pet_candidate_model.dart';

class LocationPage extends ConsumerStatefulWidget {
  const LocationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationPageState();
}

class _LocationPageState extends ConsumerState<LocationPage> {
  String? _currentAddress;
  Position? _currentPosition;
  FlutterMapMath path = FlutterMapMath();

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
      _getDistanceFromCurrentCoordinates(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getDistanceFromCurrentCoordinates(Position position) async {
    const double milesToMeters = 1609.34;
    List<double> distancesInMiles = [5, 10, 20, 50];
    List<String> distanceMessages = [];
    List<String> petsInDistanceMessages = [];
    final Distance distance = const Distance();

    var petList = ref.read(petListProvider);
    List<PetCandidateModel> filteredPets = [];
    var selectedUserRadiuses = ref.read(appliedRadiusFilterProvider);
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
        filteredPets.add(item);
      }
    }

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

    setState(() {
      _currentAddress = distanceMessages.join("\n");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location Page")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('LAT: ${_currentPosition?.latitude ?? ""}'),
              Text('LNG: ${_currentPosition?.longitude ?? ""}'),
              Text('ADDRESS: ${_currentAddress ?? ""}'),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _getCurrentPosition,
                child: const Text("Get Current Location"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
