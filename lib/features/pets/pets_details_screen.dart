import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/core/providers/common_provider.dart';
import 'package:pet_rescues/models/pet_candidate_model.dart';

class PetDetailsScreen extends ConsumerStatefulWidget {
  final String petId;

  const PetDetailsScreen({
    required this.petId,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PetsDetailsScreenState();
}

class _PetsDetailsScreenState extends ConsumerState<PetDetailsScreen> {
  List<PetCandidateModel> petList = [];
  late PetCandidateModel pet;
  @override
  void initState() {
    // Get the pet details
    petList = ref.read(petListProvider);
    pet = petList.firstWhere((pet) => pet.id == widget.petId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 400.0,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Image.asset(pet.petPics![index]);
              },
              itemCount: pet.petPics!.length,
            ),
          ),
        ],
      ),
    );
  }
}
