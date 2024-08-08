import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/features/filters/controller/filters_controller.dart';
import 'package:pet_rescues/models/filters_model.dart';
import 'package:pet_rescues/models/pet_candidate_model.dart';
import 'package:pet_rescues/settings/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final usersSettingsProvider = Provider<UsersSettings>((ref) {
  return UsersSettings();
});

class UsersSettings {
  static late SharedPreferences _sharedPreferences;

  Future<void> initialiseSettings() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  bool getUsersThemeSettings() {
    bool? settingsConfig = _sharedPreferences.getBool('Theme');
    settingsConfig ??= false;

    return settingsConfig;
  }

  Future<void> setUsersThemeSettings(bool value) async {
    await _sharedPreferences.setBool('Theme', value);
  }

//   PetFilterType getAnimalPreferenceFilterSettings() {
//     int? filterConfig = _sharedPreferences.getInt('AnimalFilter');
//     filterConfig ??= 0;
//     if (filterConfig == PetFilterType.cat) {
//       return PetFilterType.cat;
//     }

//     return filterConfig;
//   }

//   Future<void> setAnimalPreferenceFilterSettings(int value) async {
//     await _sharedPreferences.setInt('AnimalFilter', value);
//   }
// }

//   List<String> getUsersAnimalFilterSettings() {
//     List<String>? filterConfig = _sharedPreferences.getStringList('Filter');

//     return filterConfig!;
//   }

//   Future<void> setUsersAnimalFilterSettings(List<String> value) async {
//     await _sharedPreferences.setStringList('Filter', value);
//   }
// }

//   PetFilterType getAnimalPreferenceFilterSettings() {
//     int? filterConfig = _sharedPreferences.getInt('AnimalFilter');
//     filterConfig ??= 0;
//     if (filterConfig == PetFilterType.cat.index) {
//       return PetFilterType.cat;
//     } else if (filterConfig == PetFilterType.dog.index) {
//       return PetFilterType.dog;
//     } else {
//       return PetFilterType.none;
//     }
//   }

//   Future<void> setAnimalPreferenceFilterSettings(int value) async {
//     await _sharedPreferences.setInt('AnimalFilter', value);
//   }
// }

  PetFilterType getPetFilterTypeFromString() {
    String? value = _sharedPreferences.getString('AnimalFilter');
    return PetFilterType.values.firstWhere((e) => e.toString() == value,
        orElse: () => PetFilterType.none);
  }

  Future<void> setAnimalPreferenceFilterSettings(PetFilterType value) async {
    await _sharedPreferences.setString('AnimalFilter', value.toString());
  }

  List<GenderOption> getUsersGenderPreference() {
    List<String> stringList = _sharedPreferences.getStringList('Gender') ?? [];

    // Convert the list of strings back to a list of GenderOption objects.
    for (int i = 0; i < genderFilterOptions.length; i++) {
      // Safely update checkboxValue based on stringList values
      if (i < stringList.length) {
        genderFilterOptions[i]
            .copyWith(checkboxValue: stringList[i].toLowerCase() == 'true');
      } else {
        // If stringList is shorter, set a default value
        genderFilterOptions[i]
            .copyWith(checkboxValue: false); // Or some default value
      }
    }

    tempGenderFilterOptions = genderFilterOptions.toList();

    return genderFilterOptions;
  }

  Future<void> setUsersGenderPreference(List<GenderOption> value) async {
    // Convert GenderOption list to a list of strings
    List<String> stringList = value
        .map((genderOption) => genderOption.checkboxValue.toString())
        .toList();
    await _sharedPreferences.setStringList('Gender', stringList);
  }

  List<AnimalSizeOption> getUsersSizePreference() {
    List<String>? stringList = _sharedPreferences.getStringList('Size');

    // Convert the list of strings back to a list of GenderOption objects.
    if (stringList != null) {
      for (int i = 0; i < sizeFilterOptions.length; i++) {
        // Safely update checkboxValue based on stringList values
        if (i < stringList.length) {
          sizeFilterOptions[i]
              .copyWith(checkboxValue: stringList[i].toLowerCase() == 'true');
        } else {
          // If stringList is shorter, set a default value
          sizeFilterOptions[i]
              .copyWith(checkboxValue: false); // Or some default value
        }
      }
    }

    tempSizeFilterOptions = sizeFilterOptions.toList();

    return sizeFilterOptions;
  }

  Future<void> setUsersSizePreference(List<AnimalSizeOption> value) async {
    // Convert AnimalSizeOption list to a list of strings
    List<String> stringList =
        value.map((animalSize) => animalSize.checkboxValue.toString()).toList();
    await _sharedPreferences.setStringList('Size', stringList);
  }

  // FilterMenuOption getSizeFromString() {
  //   String? value = _sharedPreferences.getString('Size');
  //   return FilterMenuOption.values.firstWhere((e) => e.toString() == value,
  //       orElse: () => FilterMenuOption(
  //           title: AnimalSize.small.displayName, animalSizeOptions: []));
  // }

  // Future<void> setSizeOfAnimal(FilterMenuOption value) async {
  //   await _sharedPreferences.setString('Size', value.title.toString());
  // }
}

final initialiseSettingsProvider = FutureProvider<void>((ref) async {
  UsersSettings userSettings = ref.read(usersSettingsProvider);
  await userSettings.initialiseSettings();
  ref
      .read(darkThemeProvider.notifier)
      .update((state) => userSettings.getUsersThemeSettings());

  ref
      .read(appliedPetsToggleProvider.notifier)
      .update((state) => userSettings.getPetFilterTypeFromString());

  ref
      .read(appliedGenderFilterProvider.notifier)
      .update((state) => userSettings.getUsersGenderPreference());

  ref
      .read(appliedSizeFilterProvider.notifier)
      .update((state) => userSettings.getUsersSizePreference());
});
