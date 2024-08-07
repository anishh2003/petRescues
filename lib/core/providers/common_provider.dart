import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/features/filters/controller/filters_controller.dart';
import 'package:pet_rescues/models/pet_candidate_model.dart';

final petListProvider = Provider<List<PetCandidateModel>>((ref) {
  List<PetCandidateModel> filteredCandidates;
  var toggle = ref.watch(appliedPetsToggleProvider);
  var userSelectedGender = ref.watch(appliedGenderFilterProvider);
  var userSelectedSize = ref.watch(appliedSizeFilterProvider);

  if (toggle == PetFilterType.cat) {
    filteredCandidates =
        candidates.where((item) => item.petType == PetType.cat).toList();
  } else if (toggle == PetFilterType.dog) {
    filteredCandidates =
        candidates.where((item) => item.petType == PetType.dog).toList();
  } else {
    filteredCandidates = candidates;
  }

  if (userSelectedGender[Gender.male.index].checkboxValue &&
      userSelectedGender[Gender.female.index].checkboxValue == false) {
    filteredCandidates =
        filteredCandidates.where((item) => item.gender == Gender.male).toList();
  } else if (userSelectedGender[Gender.male.index].checkboxValue == false &&
      userSelectedGender[Gender.female.index].checkboxValue == true) {
    filteredCandidates = filteredCandidates
        .where((item) => item.gender == Gender.female)
        .toList();
  } else {
    filteredCandidates;
  }

  // if (userSelectedGender != Gender.notSure.index) {
  //   filteredCandidates = filteredCandidates
  //       .where((item) => item.gender.index == userSelectedGender)
  //       .toList();
  // } else {
  //   filteredCandidates = filteredCandidates
  //       .where((item) => item.gender.index != Gender.notSure.index)
  //       .toList();
  // }

  // if (userSelectedSize != AnimalSize.all) {
  //   filteredCandidates = filteredCandidates
  //       .where((item) => item.size == userSelectedSize)
  //       .toList();
  // } else {
  //   filteredCandidates = filteredCandidates
  //       .where((item) => item.size != AnimalSize.all)
  //       .toList();
  // }

  return filteredCandidates;
});
