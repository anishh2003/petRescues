import 'package:flutter/foundation.dart';
import 'package:pet_rescues/models/pet_candidate_model.dart';

class FilterMenuOption {
  final String title;
  List<RadiusOption>? radiusOptions;
  List<AnimalSizeOption>? animalSizeOptions;
  List<GenderOption>? genderOptions;
  List<AgeOption>? ageOptions;
  List<ShelterOption>? shelterOptions;
  List<DontShowOption>? dontShowOptions;

  FilterMenuOption({
    this.radiusOptions,
    this.animalSizeOptions,
    this.genderOptions,
    this.ageOptions,
    this.shelterOptions,
    this.dontShowOptions,
    required this.title,
  });
}

class FilterOptions {
  final String title;
  final bool checkboxValue;

  FilterOptions({
    required this.title,
    required this.checkboxValue,
  });

  FilterOptions copyWith({
    String? title,
    bool? checkboxValue,
  }) {
    return FilterOptions(
      title: title ?? this.title,
      checkboxValue: checkboxValue ?? this.checkboxValue,
    );
  }
}

class RadiusOption extends FilterOptions {
  RadiusOption({required super.title, required super.checkboxValue});

  @override
  RadiusOption copyWith({
    String? title,
    bool? checkboxValue,
  }) {
    return RadiusOption(
      title: title ?? this.title,
      checkboxValue: checkboxValue ?? this.checkboxValue,
    );
  }
}

class AnimalSizeOption extends FilterOptions {
  AnimalSizeOption({required super.title, required super.checkboxValue});

  @override
  AnimalSizeOption copyWith({
    String? title,
    bool? checkboxValue,
  }) {
    return AnimalSizeOption(
      title: title ?? this.title,
      checkboxValue: checkboxValue ?? this.checkboxValue,
    );
  }
}

class GenderOption extends FilterOptions {
  GenderOption({required super.title, required super.checkboxValue});

  @override
  GenderOption copyWith({
    String? title,
    bool? checkboxValue,
  }) {
    return GenderOption(
      title: title ?? this.title,
      checkboxValue: checkboxValue ?? this.checkboxValue,
    );
  }
}

class AgeOption extends FilterOptions {
  AgeOption({required super.title, required super.checkboxValue});

  @override
  AgeOption copyWith({
    String? title,
    bool? checkboxValue,
  }) {
    return AgeOption(
      title: title ?? this.title,
      checkboxValue: checkboxValue ?? this.checkboxValue,
    );
  }
}

class ShelterOption extends FilterOptions {
  ShelterOption({required super.title, required super.checkboxValue});

  @override
  ShelterOption copyWith({
    String? title,
    bool? checkboxValue,
  }) {
    return ShelterOption(
      title: title ?? this.title,
      checkboxValue: checkboxValue ?? this.checkboxValue,
    );
  }
}

class DontShowOption extends FilterOptions {
  DontShowOption({required super.title, required super.checkboxValue});

  @override
  DontShowOption copyWith({
    String? title,
    bool? checkboxValue,
  }) {
    return DontShowOption(
      title: title ?? this.title,
      checkboxValue: checkboxValue ?? this.checkboxValue,
    );
  }
}

List<FilterMenuOption> filterMenuOptions = [
  FilterMenuOption(title: 'Radius', radiusOptions: radiusFilterOptions),
  FilterMenuOption(title: 'Size', animalSizeOptions: sizeFilterOptions),
  FilterMenuOption(title: 'Gender', genderOptions: genderFilterOptions),
  FilterMenuOption(title: 'Age', ageOptions: ageFilterOptions),
  FilterMenuOption(title: 'Shelter', shelterOptions: shelterFilterOptions),
  FilterMenuOption(
      title: 'Don\'t Show', dontShowOptions: dontShowFilterOptions),
];

List<RadiusOption> radiusFilterOptions = [
  RadiusOption(title: '5 miles', checkboxValue: false),
  RadiusOption(title: '10 miles', checkboxValue: false),
  RadiusOption(title: '20 miles', checkboxValue: false),
  RadiusOption(title: '20+ miles', checkboxValue: false),
];

List<AnimalSizeOption> tempSizeFilterOptions = [];

List<AnimalSizeOption> sizeFilterOptions = [
  AnimalSizeOption(title: AnimalSize.small.displayName, checkboxValue: false),
  AnimalSizeOption(title: AnimalSize.medium.displayName, checkboxValue: false),
  AnimalSizeOption(title: AnimalSize.large.displayName, checkboxValue: false),
  AnimalSizeOption(title: AnimalSize.giant.displayName, checkboxValue: false),
];

List<GenderOption> tempGenderFilterOptions = [];

List<GenderOption> genderFilterOptions = [
  GenderOption(title: Gender.male.displayGender, checkboxValue: false),
  GenderOption(title: Gender.female.displayGender, checkboxValue: false),
];

List<AgeOption> ageFilterOptions = [
  AgeOption(title: '< 1', checkboxValue: false),
  AgeOption(title: '1-4', checkboxValue: false),
  AgeOption(title: '4-7', checkboxValue: false),
  AgeOption(title: '7+', checkboxValue: false),
];

List<ShelterOption> shelterFilterOptions = [
  ShelterOption(title: 'Dali dog Rescue', checkboxValue: false),
  ShelterOption(title: 'Be Kind Rescue', checkboxValue: false),
  ShelterOption(title: 'Love underdogs', checkboxValue: false),
  ShelterOption(title: 'Miracle\'s Mission', checkboxValue: false),
];

List<DontShowOption> dontShowFilterOptions = [
  DontShowOption(title: 'Unknown with children', checkboxValue: false),
  DontShowOption(title: 'Unknown with dogs', checkboxValue: false),
  DontShowOption(title: 'Unknown with cats', checkboxValue: false),
];
