import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/models/pet_candidate_model.dart';

final petListProvider = Provider<List<PetCandidateModel>>((ref) {
  return candidates;
});
