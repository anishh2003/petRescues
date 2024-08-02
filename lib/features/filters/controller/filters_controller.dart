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

class Filter {
  static void setAnimalTypeFilter(int? value, WidgetRef ref) {
    if (value == PetFilterType.cat.index) {
      ref
          .read(tempSelectedPetsToggleProvider.notifier)
          .update((state) => PetFilterType.cat);
    } else if (value == PetFilterType.dog.index) {
      ref
          .read(tempSelectedPetsToggleProvider.notifier)
          .update((state) => PetFilterType.dog);
    } else {
      ref
          .read(tempSelectedPetsToggleProvider.notifier)
          .update((state) => PetFilterType.none);
    }
  }
}
