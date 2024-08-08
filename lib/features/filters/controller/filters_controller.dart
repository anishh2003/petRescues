import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/models/filters_model.dart';
import 'package:pet_rescues/models/pet_candidate_model.dart';

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

final sizeProvider = StateProvider<FilterMenuOption>((ref) {
  return FilterMenuOption(title: AnimalSize.small.displayName);
});

//**-------------------- Gender selection ------------------------------**//

final tempGenderSelectedProvider = StateProvider<List<GenderOption>>((ref) {
  return tempGenderFilterOptions;
});

final appliedGenderFilterProvider = StateProvider<List<GenderOption>>((ref) {
  return genderFilterOptions;
});

//**--------------------------------------------------------------------**//

//**-------------------- Gender selection ------------------------------**//

final tempSizeSelectedProvider = StateProvider<List<AnimalSizeOption>>((ref) {
  return tempSizeFilterOptions;
});

final appliedSizeFilterProvider = StateProvider<List<AnimalSizeOption>>((ref) {
  return sizeFilterOptions;
});

//**--------------------------------------------------------------------**//
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
