import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pet_rescues/core/utils.dart';
import 'package:pet_rescues/features/geolocation/repository/geolocation_repository.dart';

final currentPositionProvider = StateProvider<Position?>((ref) {
  return null;
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
}
