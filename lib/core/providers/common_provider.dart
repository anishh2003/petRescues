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
  var toggle = ref.watch(appliedPetsToggleProvider);
  if (toggle == PetFilterType.cat) {
    return candidates.where((item) => item.petType == PetType.cat).toList();
  } else if (toggle == PetFilterType.dog) {
    return candidates.where((item) => item.petType == PetType.dog).toList();
  } else {
    return candidates;
  }
});
