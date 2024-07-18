import 'package:flutter/cupertino.dart';

class PetCandidateModel {
  String? name;
  String? job;
  String? city;
  List<String>? petPics;

  PetCandidateModel({
    this.name,
    this.job,
    this.city,
    this.petPics,
  });
}

List<PetCandidateModel> candidates = [
  PetCandidateModel(
    name: 'Charles Dickens (charlie), 8',
    job: 'Manager',
    city: 'Town',
    petPics: [
      'assets/pets/dogs/charles/charles_1.jpg',
      'assets/pets/dogs/charles/charles_2.png',
      'assets/pets/dogs/charles/charles_3.png'
    ],
  ),
  PetCandidateModel(
    name: 'Seven, 7',
    job: 'Manager',
    city: 'Town',
    petPics: [],
  ),
  PetCandidateModel(
    name: 'Six, 6',
    job: 'Manager',
    city: 'Town',
    petPics: [],
  ),
  PetCandidateModel(
    name: 'Five, 5',
    job: 'Manager',
    city: 'Town',
    petPics: [],
  ),
  PetCandidateModel(
    name: 'Four, 4',
    job: 'Manager',
    city: 'Town',
    petPics: [],
  ),
  PetCandidateModel(
    name: 'Three, 3',
    job: 'Manager',
    city: 'Town',
    petPics: [],
  ),
  PetCandidateModel(
    name: 'Two, 2',
    job: 'Manager',
    city: 'Town',
    petPics: [],
  ),
  PetCandidateModel(
    name: 'One, 1',
    job: 'Manager',
    city: 'Town',
    petPics: [],
  ),
];

// const LinearGradient gradientRed = LinearGradient(
//   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//   colors: [
//     Color(0xFFFF3868),
//     Color(0xFFFFB49A),
//   ],
// );

// const LinearGradient gradientPurple = LinearGradient(
//   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//   colors: [
//     Color(0xFF736EFE),
//     Color(0xFF62E4EC),
//   ],
// );

// const LinearGradient gradientBlue = LinearGradient(
//   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//   colors: [
//     Color(0xFF0BA4E0),
//     Color(0xFFA9E4BD),
//   ],
// );
