import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/features/filters/controller/filters_controller.dart';
import 'package:pet_rescues/models/pet_candidate_model.dart';

final petListProvider = Provider<List<PetCandidateModel>>((ref) {
  List<PetCandidateModel> filteredCandidates;
  var toggle = ref.watch(appliedPetsToggleProvider);
  var userSelectedGender = ref.watch(appliedGenderFilterProvider);
  var userSelectedSize = ref.watch(appliedSizeFilterProvider);

  //-----------Pet type Filtering ----------------------------------------//

  if (toggle == PetFilterType.cat) {
    filteredCandidates =
        candidates.where((item) => item.petType == PetType.cat).toList();
  } else if (toggle == PetFilterType.dog) {
    filteredCandidates =
        candidates.where((item) => item.petType == PetType.dog).toList();
  } else {
    filteredCandidates = candidates;
  }
  //-----------Gender Filtering ----------------------------------------//

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

//---------------  Animal Size Filtering --------------------------------//

  // Step 1: Identify selected sizes
  List<AnimalSize> selectedSizes = userSelectedSize
      .where((option) => option.checkboxValue)
      .map((option) {
        if (option.title == AnimalSize.small.displayName) {
          return AnimalSize.small;
        } else if (option.title == AnimalSize.medium.displayName) {
          return AnimalSize.medium;
        } else if (option.title == AnimalSize.large.displayName) {
          return AnimalSize.large;
        } else if (option.title == AnimalSize.giant.displayName) {
          return AnimalSize.giant;
        } else {
          return null; // Handle unexpected cases
        }
      })
      .whereType<AnimalSize>()
      .toList();

  if (selectedSizes.isNotEmpty) {
    // Step 2: Filter candidates by selected sizes
    filteredCandidates = filteredCandidates.where((candidate) {
      return selectedSizes.contains(candidate.size);
    }).toList();
  }

  return filteredCandidates;
});

//--------------------------------------------------------------------------//
