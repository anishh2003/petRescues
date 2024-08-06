import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/features/filters/controller/filters_controller.dart';
import 'package:pet_rescues/models/pet_candidate_model.dart';

// final petsListProvider = Provider<List<PetCandidateModel>>((ref) {
//   return candidates;
// });

// final catListProvider = Provider<List<PetCandidateModel>>((ref) {
//   return candidates.where((item) => item.petType == PetType.cat).toList();
// });

// final dogListProvider = Provider<List<PetCandidateModel>>((ref) {
//   return candidates.where((item) => item.petType == PetType.dog).toList();
// });

final petListProvider = Provider<List<PetCandidateModel>>((ref) {
  List<PetCandidateModel> filteredCandidates;
  var toggle = ref.watch(appliedPetsToggleProvider);
  var userSelectedGender = ref.watch(appliedGenderFilterProvider);
  if (toggle == PetFilterType.cat) {
    filteredCandidates =
        candidates.where((item) => item.petType == PetType.cat).toList();
  } else if (toggle == PetFilterType.dog) {
    filteredCandidates =
        candidates.where((item) => item.petType == PetType.dog).toList();
  } else {
    filteredCandidates = candidates;
  }

  if (userSelectedGender != Gender.notSure.index) {
    return filteredCandidates
        .where((item) => item.gender.index == userSelectedGender)
        .toList();
  }
  return filteredCandidates;
});


// final petListProvider = Provider<List<PetCandidateModel>>((ref) {
//   List<PetCandidateModel> petList = candidates;
//   var toggle = ref.watch(appliedPetsToggleProvider);
//   var animalGender = ref.watch(appliedGenderFilterProvider);
//   var userSelectedGender = ref.watch(appliedGenderFilterProvider);
//   if (toggle == PetFilterType.cat) {
//     petList.where((item) => item.petType == PetType.cat).toList();

//     petList.where((item) => item.gender == userSelectedGender).toList();

//     return petList;
//   } else if (toggle == PetFilterType.dog) {
//     return candidates.where((item) => item.petType == PetType.dog).toList();
//   } else {
//     return candidates;
//   }
// });

