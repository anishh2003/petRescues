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
    id: '1',
    petType: PetType.cat,
    name: 'Oreo , 2',
    job: 'Manager',
    city: 'Town',
    petPics: [
      'assets/pets/cats/oreo/oreo_1.jpeg',
    ],
  ),
  PetCandidateModel(
    id: '2',
    petType: PetType.dog,
    name: 'Six, 6',
    job: 'Manager',
    city: 'Town',
    petPics: [
      Constants.logoPath,
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
];
