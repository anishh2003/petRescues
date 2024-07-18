import 'package:flutter/cupertino.dart';
import 'package:pet_rescues/core/constants/constants.dart';

enum PetType {
  dog,
  cat,
}

class PetCandidateModel {
  PetType? petType;
  String? id;
  String? name;

  String? job;
  String? city;

  List<String>? petPics;

  PetCandidateModel({
    this.petType,
    this.id,
    this.name,
    this.job,
    this.city,
    this.petPics,
  });
}

List<PetCandidateModel> candidates = [
  PetCandidateModel(
    petType: PetType.dog,
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
    petType: PetType.cat,
    name: 'Oreo , 2',
    job: 'Manager',
    city: 'Town',
    petPics: [
      'assets/pets/cats/oreo/oreo_1.jpeg',
    ],
  ),
  PetCandidateModel(
    petType: PetType.dog,
    name: 'Six, 6',
    job: 'Manager',
    city: 'Town',
    petPics: [
      Constants.logoPath,
    ],
  ),
  PetCandidateModel(
    petType: PetType.dog,
    name: 'Five, 5',
    job: 'Manager',
    city: 'Town',
    petPics: [
      Constants.logoPath,
    ],
  ),
  PetCandidateModel(
    petType: PetType.dog,
    name: 'Four, 4',
    job: 'Manager',
    city: 'Town',
    petPics: [
      Constants.logoPath,
    ],
  ),
  PetCandidateModel(
    petType: PetType.cat,
    name: 'Cat Three, 3',
    job: 'Manager',
    city: 'Town',
    petPics: [
      Constants.logoPath,
    ],
  ),
  PetCandidateModel(
    petType: PetType.cat,
    name: 'Cat Two, 2',
    job: 'Manager',
    city: 'Town',
    petPics: [
      Constants.logoPath,
    ],
  ),
  PetCandidateModel(
    name: 'One, 1',
    job: 'Manager',
    city: 'Town',
    petPics: [
      Constants.logoPath,
    ],
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
