import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/models/filters_model.dart';

enum PetFilterType {
  none,
  cat,
  dog,
}

//**-------------------- Pet type  Provider ------------------------------**//

final tempSelectedPetsToggleProvider = StateProvider<PetFilterType>((ref) {
  return PetFilterType.none;
});

final appliedPetsToggleProvider = StateProvider<PetFilterType>((ref) {
  return PetFilterType.none;
});

//**-------------------- Gender Provider ------------------------------**//

final tempGenderSelectedProvider = StateProvider<List<GenderOption>>((ref) {
  return tempGenderFilterOptions;
});

final appliedGenderFilterProvider = StateProvider<List<GenderOption>>((ref) {
  return genderFilterOptions;
});

//**-------------------- Size provider ------------------------------**//

final tempSizeSelectedProvider = StateProvider<List<AnimalSizeOption>>((ref) {
  return tempSizeFilterOptions;
});

final appliedSizeFilterProvider = StateProvider<List<AnimalSizeOption>>((ref) {
  return sizeFilterOptions;
});

//**-------------------- Age provider ------------------------------**//

final tempAgeSelectedProvider = StateProvider<List<AgeOption>>((ref) {
  return tempAgeFilterOptions;
});

final appliedAgeFilterProvider = StateProvider<List<AgeOption>>((ref) {
  return ageFilterOptions;
});

//**-------------------- Dont show options provider ------------------------------**//

final tempDontShowOptionsProvider = StateProvider<List<DontShowOption>>((ref) {
  return tempDontShowFilterOptions;
});

final appliedDontShowOptionsProvider =
    StateProvider<List<DontShowOption>>((ref) {
  return dontShowFilterOptions;
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
