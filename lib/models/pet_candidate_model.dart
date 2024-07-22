import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    id: '0',
    petType: PetType.dog,
    name: 'Puppy (charlie), 8',
    job: 'Manager',
    city: 'Town',
    petPics: [
      'assets/images/pets/dogs/puppy/puppy1.jpg',
      'assets/images/pets/dogs/puppy/puppy2.jpg',
    ],
  ),
  PetCandidateModel(
    id: '1',
    petType: PetType.cat,
    name: 'Oreo , 2',
    job: 'Manager',
    city: 'Town',
    petPics: [
      'assets/images/pets/cats/oreo/oreo_1.jpeg',
    ],
  ),
  PetCandidateModel(
    id: '2',
    petType: PetType.dog,
    name: 'Six, 6',
    job: 'Manager',
    city: 'Town',
    petPics: [
      'assets/images/pets/dogs/husky/husky1.jpg',
      'assets/images/pets/dogs/husky/husky2.jpg',
      'assets/images/pets/dogs/husky/husky3.jpg',
    ],
  ),
  PetCandidateModel(
    id: '3',
    petType: PetType.dog,
    name: 'Five, 5',
    job: 'Manager',
    city: 'Town',
    petPics: [
      Constants.logoPath,
    ],
  ),
  PetCandidateModel(
    id: '4',
    petType: PetType.dog,
    name: 'Four, 4',
    job: 'Manager',
    city: 'Town',
    petPics: [
      Constants.logoPath,
    ],
  ),
  PetCandidateModel(
    id: '5',
    petType: PetType.cat,
    name: 'Cat Three, 3',
    job: 'Manager',
    city: 'Town',
    petPics: [
      Constants.logoPath,
    ],
  ),
  PetCandidateModel(
    id: '6',
    petType: PetType.cat,
    name: 'Cat Two, 2',
    job: 'Manager',
    city: 'Town',
    petPics: [
      Constants.logoPath,
    ],
  ),
  PetCandidateModel(
    id: '7',
    name: 'One, 1',
    job: 'Manager',
    city: 'Town',
    petPics: [
      Constants.logoPath,
    ],
  ),
  PetCandidateModel(
    id: '8',
    petType: PetType.dog,
    name: 'Polly  (Paul), 10',
    job: 'Manager',
    city: 'Town',
    petPics: [
      'assets/images/pets/dogs/polly/polly_1.jpg',
      'assets/images/pets/dogs/polly/polly_2.jpg',
      'assets/images/pets/dogs/polly/polly_3.jpg',
      'assets/images/pets/dogs/polly/polly_1.webp',
      'assets/images/pets/dogs/polly/polly_2.webp',
      'assets/images/pets/dogs/polly/polly_3.webp'
    ],
  ),
];
