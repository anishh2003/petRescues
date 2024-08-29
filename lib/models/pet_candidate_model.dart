// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pet_rescues/core/constants/constants.dart';

enum PetType {
  dog,
  cat,
}

enum PetRadius { fiveMiles, tenMiles, twentyMiles, fiftyMiles }

extension PetRadiusExtension on PetRadius {
  String get displayName {
    switch (this) {
      case PetRadius.fiveMiles:
        return '5';
      case PetRadius.tenMiles:
        return '10';
      case PetRadius.twentyMiles:
        return '20';
      case PetRadius.fiftyMiles:
        return '50';
      default:
        return '';
    }
  }
}

enum Gender { male, female, notSure }

extension GenderExtension on Gender {
  String get displayGender {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.notSure:
        return 'NotSure';
      default:
        return '';
    }
  }
}

enum AnimalSize { small, medium, large, giant, all }

extension SizeExtension on AnimalSize {
  String get displayName {
    switch (this) {
      case AnimalSize.small:
        return 'Small';
      case AnimalSize.medium:
        return 'Medium';
      case AnimalSize.large:
        return 'Large';
      case AnimalSize.giant:
        return 'Giant';
      default:
        return '';
    }
  }
}

enum AnimalAge { lessThanOne, oneToFour, fourToSeven, sevenPlus }

extension AgeExtension on AnimalAge {
  String get displayName {
    switch (this) {
      case AnimalAge.lessThanOne:
        return '< 1';
      case AnimalAge.oneToFour:
        return '1-4';
      case AnimalAge.fourToSeven:
        return '4-7';
      case AnimalAge.sevenPlus:
        return '7+';
      default:
        return '';
    }
  }
}

enum Unknown { children, dogs, cats }

extension UnknownExtension on Unknown {
  String get displayName {
    switch (this) {
      case Unknown.children:
        return 'Unknown with children';
      case Unknown.dogs:
        return 'Unknown with dogs';
      case Unknown.cats:
        return 'Unknown with cats';
      default:
        return '';
    }
  }

  String get description {
    switch (this) {
      case Unknown.children:
        return 'It is not known if this pet can live with children';
      case Unknown.dogs:
        return 'It is not known if this pet can live with dogs';
      case Unknown.cats:
        return 'It is not known if this pet can live with cats';
      default:
        return '';
    }
  }
}

enum Shelter { dali, beKind, love, miracle }

extension ShelterExtension on Shelter {
  String get displayName {
    switch (this) {
      case Shelter.dali:
        return 'Dali dog Rescue';
      case Shelter.beKind:
        return 'Furry Rescue Italy';
      case Shelter.love:
        return 'Love underdogs';
      case Shelter.miracle:
        return 'Miracle\'s Mission';
      default:
        return '';
    }
  }
}

class PetBubble {
  final String? text;
  final IconData? icon;
  Color? confidenceColor;

  PetBubble({
    this.text,
    this.icon,
    required this.confidenceColor,
  });
}

// enum Procedures {
//   vaccinated,
//   microchipped,
//   neutered,
// }

class PetCandidateModel {
  PetType? petType;
  String? id;
  String? name;
  AnimalSize size;
  Gender gender;
  int age;

  double? distance;
  String? location;
  String? description;

  List<String>? petPics;
  List<Unknown>? unknowns;
  List<String>? procedures;
  List<PetBubble>? bubbleOptions;
  Shelter rescueOrganisation;

  PetCandidateModel({
    this.petType,
    this.id,
    this.name,
    required this.size,
    required this.gender,
    required this.age,
    this.distance,
    this.location,
    this.description,
    this.petPics,
    this.unknowns,
    this.procedures,
    this.bubbleOptions,
    required this.rescueOrganisation,
  });
}

List<PetCandidateModel> candidates = [
  PetCandidateModel(
    id: '0',
    petType: PetType.dog,
    name: 'Puppy (charlie)',
    gender: Gender.male,
    size: AnimalSize.medium,
    age: 8,
    location: '18-19 Western Rd, Brighton and Hove, Hove BN3 1AE',
    petPics: [
      'assets/images/pets/dogs/puppy/puppy1.jpg',
      'assets/images/pets/dogs/puppy/puppy2.jpg',
    ],
    description:
        'Meet Puppy, an 8-year-old bundle of love looking for his forever home! Despite his name, Puppy is a mature and well-behaved dog who enjoys the simple pleasures in life. He loves leisurely walks, snuggling on the couch, and basking in the sun. Puppy is house-trained, gentle, and gets along well with other pets and children. If you\'re looking for a loyal and affectionate companion to share your days with, Puppy is the perfect match. Give this sweet boy a chance, and he\'ll fill your home with unconditional love and joy. Adopt Puppy today and make a friend for life!',
    procedures: ['Vaccinated', 'Microchipped', 'Neutered'],
    bubbleOptions: [
      PetBubble(
        text: 'Belgian Malinois',
        confidenceColor: Colors.green,
        icon: Icons.pets,
      ),
      PetBubble(
        text: 'Retriever',
        confidenceColor: Colors.red,
        icon: Icons.pets,
      ),
      PetBubble(
        text: 'Spaniel',
        confidenceColor: Colors.orange,
        icon: Icons.pets,
      ),
      PetBubble(
        text: 'Female',
        confidenceColor: Colors.green,
        icon: Icons.female,
      ),
      PetBubble(
        text: '1-2 hours',
        confidenceColor: Colors.orange,
        icon: Icons.directions_walk,
      ),
      PetBubble(
        text: '2+ hours',
        confidenceColor: Colors.red,
        icon: Icons.directions_walk,
      ),
      PetBubble(
        text: 'Can live with cats',
        confidenceColor: Colors.green,
        icon: Icons.cruelty_free,
      ),
      PetBubble(
        text: 'Can live with dogs',
        confidenceColor: Colors.yellow,
        icon: Icons.cruelty_free,
      ),
      PetBubble(
        text: 'Can live with children',
        confidenceColor: Colors.green,
        icon: Icons.cruelty_free,
      ),
    ],
    rescueOrganisation: Shelter.beKind,
  ),
  PetCandidateModel(
    id: '1',
    petType: PetType.cat,
    name: 'Oreo',
    gender: Gender.male,
    size: AnimalSize.small,
    age: 2,
    location:
        'Unit 3, 25 Carlton Terrace, Brighton and Hove, Brighton BN41 1XF',
    petPics: [
      'assets/images/pets/cats/oreo/oreo_1.jpeg',
    ],
    description:
        'Meet Oreo, a charming 2-year-old cat with a personality as sweet as his name! Oreo is a playful and curious feline who loves exploring his surroundings and engaging in fun games. His striking black and white coat adds to his irresistible charm. Oreo is affectionate, enjoys being petted, and will happily curl up in your lap for a cozy nap. He gets along well with other pets and is great with children. If you\'re looking for a delightful and loving addition to your family, Oreo is the purr-fect choice. Adopt Oreo today and let him bring joy and companionship into your home!',
    procedures: ['Vaccinated', 'Microchipped'],
    bubbleOptions: [
      PetBubble(
        text: 'Other',
        confidenceColor: Colors.green,
        icon: Icons.pets,
      ),
      PetBubble(
        text: 'Male',
        confidenceColor: Colors.red,
        icon: Icons.male,
      ),
      PetBubble(
        text: '2+ hours',
        confidenceColor: Colors.green,
        icon: Icons.directions_walk,
      ),
      PetBubble(
        text: 'Can live with cats',
        confidenceColor: Colors.yellow,
        icon: Icons.cruelty_free,
      ),
      PetBubble(
        text: 'Can live with dogs',
        confidenceColor: Colors.green,
        icon: Icons.cruelty_free,
      ),
      PetBubble(
        text: 'Can live with children',
        confidenceColor: Colors.red,
        icon: Icons.cruelty_free,
      ),
    ],
    rescueOrganisation: Shelter.dali,
  ),
  PetCandidateModel(
    id: '2',
    petType: PetType.dog,
    name: 'Six',
    gender: Gender.female,
    size: AnimalSize.large,
    age: 6,
    location: '13, Tulip Close, Sale, Greater Manchester M33 5RX',
    petPics: [
      'assets/images/pets/dogs/husky/husky1.jpg',
      'assets/images/pets/dogs/husky/husky2.jpg',
      'assets/images/pets/dogs/husky/husky3.jpg',
    ],
    description:
        'Meet Husky, a spirited 6-year-old dog with a heart full of love and adventure! Husky is an energetic and loyal companion who loves outdoor activities, from long walks to playing fetch. His striking appearance and bright eyes reflect his vibrant personality. Husky is well-trained, intelligent, and gets along wonderfully with other pets and children. If you\'re looking for a devoted and playful friend to join your family, Husky is the perfect match. Adopt Husky today and embark on countless adventures together!',
    unknowns: [Unknown.cats],
    procedures: [
      'Vaccinated',
      'Microchipped',
    ],
    bubbleOptions: [
      PetBubble(
        text: 'Husky',
        confidenceColor: Colors.green,
        icon: Icons.pets,
      ),
      PetBubble(
        text: 'Other',
        confidenceColor: Colors.red,
        icon: Icons.pets,
      ),
      PetBubble(
        text: 'Male',
        confidenceColor: Colors.green,
        icon: Icons.male,
      ),
      PetBubble(
        text: '2+ hours',
        confidenceColor: Colors.green,
        icon: Icons.directions_walk,
      ),
      PetBubble(
        text: 'Can live with dogs',
        confidenceColor: Colors.yellow,
        icon: Icons.cruelty_free,
      ),
      PetBubble(
        text: 'Can live with children',
        confidenceColor: Colors.green,
        icon: Icons.cruelty_free,
      ),
    ],
    rescueOrganisation: Shelter.dali,
  ),
  PetCandidateModel(
    id: '3',
    petType: PetType.dog,
    size: AnimalSize.small,
    name: 'Dog Five',
    gender: Gender.female,
    age: 5,
    location: '255/3, Canongate, Edinburgh, Midlothian EH8 8BQ',
    petPics: [
      Constants.logoPath,
    ],
    unknowns: [Unknown.children],
    procedures: [],
    rescueOrganisation: Shelter.miracle,
  ),
  PetCandidateModel(
    id: '4',
    petType: PetType.dog,
    name: 'Dog Four',
    gender: Gender.male,
    size: AnimalSize.giant,
    age: 4,
    location: '4, Marsh Road, Middlesbrough TS1 5LB',
    petPics: [
      Constants.logoPath,
    ],
    procedures: [],
    rescueOrganisation: Shelter.miracle,
  ),
  PetCandidateModel(
    id: '5',
    petType: PetType.cat,
    name: 'Cat Three',
    gender: Gender.female,
    size: AnimalSize.small,
    age: 3,
    location:
        'Dean House, 38, Apartment 113, Upper Dean Street, Birmingham, West Midlands B5 4SG',
    petPics: [
      Constants.logoPath,
    ],
    procedures: [],
    rescueOrganisation: Shelter.dali,
  ),
  PetCandidateModel(
    id: '6',
    petType: PetType.cat,
    name: 'Cat Two',
    gender: Gender.male,
    size: AnimalSize.medium,
    age: 2,
    location:
        'Unit 3, 25 Carlton Terrace, Brighton and Hove, Brighton BN41 1XF',
    petPics: [
      Constants.logoPath,
    ],
    procedures: [],
    rescueOrganisation: Shelter.love,
  ),
  PetCandidateModel(
    id: '7',
    name: 'Cat One',
    petType: PetType.cat,
    gender: Gender.male,
    size: AnimalSize.large,
    age: 1,
    location: 'Wivelsfield, Haywards Heath RH17 7RD',
    petPics: [
      Constants.logoPath,
    ],
    procedures: [],
    rescueOrganisation: Shelter.beKind,
  ),
  PetCandidateModel(
    id: '8',
    petType: PetType.dog,
    name: 'Polly  (Paul)',
    gender: Gender.male,
    size: AnimalSize.giant,
    age: 10,
    location: '55 Station Rd, Burgess Hill RH15 9DY',
    petPics: [
      Constants.logoPath,
    ],
    unknowns: [Unknown.cats, Unknown.dogs, Unknown.children],
    procedures: [],
    rescueOrganisation: Shelter.beKind,
  ),
];
