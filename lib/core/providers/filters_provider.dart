import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PetFilterType {
  none,
  cat,
  dog,
}

final tempSelectedPetsToggleProvider = StateProvider<PetFilterType>((ref) {
  return PetFilterType.none;
});

final appliedPetsToggleProvider = StateProvider<PetFilterType>((ref) {
  return PetFilterType.none;
});
