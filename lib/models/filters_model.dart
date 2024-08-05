// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  FilterOptions({required this.title});
}

class RadiusOption extends FilterOptions {
  RadiusOption({required super.title});
}

class AnimalSizeOption extends FilterOptions {
  AnimalSizeOption({required super.title});
}

class GenderOption extends FilterOptions {
  GenderOption({required super.title});
}

class AgeOption extends FilterOptions {
  AgeOption({required super.title});
}

class ShelterOption extends FilterOptions {
  ShelterOption({required super.title});
}

class DontShowOption extends FilterOptions {
  DontShowOption({required super.title});
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
  RadiusOption(title: '5 miles'),
  RadiusOption(title: '10 miles'),
  RadiusOption(title: '20 miles'),
  RadiusOption(title: '20+ miles'),
];

List<AnimalSizeOption> sizeFilterOptions = [
  AnimalSizeOption(title: AnimalSize.small.displayName),
  AnimalSizeOption(title: AnimalSize.medium.displayName),
  AnimalSizeOption(title: AnimalSize.large.displayName),
  AnimalSizeOption(title: AnimalSize.giant.displayName),
];

List<GenderOption> genderFilterOptions = [
  GenderOption(title: Gender.male.displayGender),
  GenderOption(title: Gender.female.displayGender),
];

List<AgeOption> ageFilterOptions = [
  AgeOption(title: '< 1'),
  AgeOption(title: '1-4'),
  AgeOption(title: '4-7'),
  AgeOption(title: '7+'),
];

List<ShelterOption> shelterFilterOptions = [
  ShelterOption(title: 'Dali dog Rescue'),
  ShelterOption(title: 'Be Kind Rescue'),
  ShelterOption(title: 'Love underdogs'),
  ShelterOption(title: 'Miracle\'s Mission'),
];

List<DontShowOption> dontShowFilterOptions = [
  DontShowOption(title: 'Unknown with children'),
  DontShowOption(title: 'Unknown with dogs'),
  DontShowOption(title: 'Unknown with cats'),
];
