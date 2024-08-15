import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/features/filters/controller/filters_controller.dart';
import 'package:pet_rescues/models/filters_model.dart';
import 'package:pet_rescues/models/pet_candidate_model.dart';

final petListProvider = Provider<List<PetCandidateModel>>((ref) {
  List<PetCandidateModel> filteredCandidates;
  var toggle = ref.watch(appliedPetsToggleProvider);
  var userSelectedGender = ref.watch(appliedGenderFilterProvider);
  var userSelectedSize = ref.watch(appliedSizeFilterProvider);
  var userSelectedAge = ref.watch(appliedAgeFilterProvider);
  var userSelectedUnknowns = ref.watch(appliedDontShowOptionsProvider);
  var userSelectedShelters = ref.watch(appliedShelterOptionsProvider);
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

//---------------  Animal Age Filtering --------------------------------//

  // Step 1: Identify selected age
  List<AnimalAge> selectedAges = userSelectedAge
      .where((option) => option.checkboxValue)
      .map((option) {
        if (option.title == AnimalAge.lessThanOne.displayName) {
          return AnimalAge.lessThanOne;
        } else if (option.title == AnimalAge.oneToFour.displayName) {
          return AnimalAge.oneToFour;
        } else if (option.title == AnimalAge.fourToSeven.displayName) {
          return AnimalAge.fourToSeven;
        } else if (option.title == AnimalAge.sevenPlus.displayName) {
          return AnimalAge.sevenPlus;
        } else {
          return null; // Handle unexpected cases
        }
      })
      .whereType<AnimalAge>()
      .toList();

  if (selectedAges.isNotEmpty) {
    // Step 2: Filter candidates by selected ages

    AnimalAge animalAge = AnimalAge.lessThanOne;
    filteredCandidates = filteredCandidates.where((candidate) {
      if (candidate.age < 1) {
        animalAge = AnimalAge.lessThanOne;
      } else if (candidate.age > 1 && candidate.age < 4) {
        animalAge = AnimalAge.oneToFour;
      } else if (candidate.age > 4 && candidate.age < 7) {
        animalAge = AnimalAge.fourToSeven;
      } else if (candidate.age > 7) {
        animalAge = AnimalAge.sevenPlus;
      }

      return selectedAges.contains(animalAge);
    }).toList();
  }

  //---------------  Shelter Filtering --------------------------------//

  // Step 1: Identify selected age
  List<Shelter> selectedShelters = userSelectedShelters
      .where((option) => option.checkboxValue)
      .map((option) {
        if (option.title == Shelter.dali.displayName) {
          return Shelter.dali;
        } else if (option.title == Shelter.beKind.displayName) {
          return Shelter.beKind;
        } else if (option.title == Shelter.love.displayName) {
          return Shelter.love;
        } else if (option.title == Shelter.miracle.displayName) {
          return Shelter.miracle;
        } else {
          return null; // Handle unexpected cases
        }
      })
      .whereType<Shelter>()
      .toList();

  if (selectedShelters.isNotEmpty) {
    // Step 2: Filter candidates by selected sizes
    filteredCandidates = filteredCandidates.where((candidate) {
      return selectedShelters.contains(candidate.rescueOrganisation);
    }).toList();
  }

//---------------  Unknown Filtering --------------------------------//

  // Step 1: Identify selected age
  List<Unknown> selectedUnknowns = userSelectedUnknowns
      .where((option) => option.checkboxValue)
      .map((option) {
        if (option.title == Unknown.children.displayName) {
          return Unknown.children;
        } else if (option.title == Unknown.cats.displayName) {
          return Unknown.cats;
        } else if (option.title == Unknown.dogs.displayName) {
          return Unknown.dogs;
        } else {
          return null; // Handle unexpected cases
        }
      })
      .whereType<Unknown>()
      .toList();

  if (selectedUnknowns.isNotEmpty) {
    filteredCandidates = filteredCandidates.where((candidate) {
      if (candidate.unknowns == null) {
        return true;
      }
      return candidate.unknowns!
          .every((item) => !selectedUnknowns.contains(item));
    }).toList();
  }

//--------------------------------------------------------------------------//

  return filteredCandidates;
});
