// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:pet_rescues/core/constants/constants.dart';

enum PetType {
  dog,
  cat,
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

  String? job;
  String? city;
  String? description;

  List<String>? petPics;
  List<String>? procedures;
  List<PetBubble>? bubbleOptions;

  PetCandidateModel({
    this.petType,
    this.id,
    this.name,
    this.job,
    this.city,
    this.description,
    this.petPics,
    this.procedures,
    this.bubbleOptions,
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
    description:
        'Meet Oreo, a charming 2-year-old cat with a personality as sweet as his name! Oreo is a playful and curious feline who loves exploring his surroundings and engaging in fun games. His striking black and white coat adds to his irresistible charm. Oreo is affectionate, enjoys being petted, and will happily curl up in your lap for a cozy nap. He gets along well with other pets and is great with children. If you\'re looking for a delightful and loving addition to your family, Oreo is the purr-fect choice. Adopt Oreo today and let him bring joy and companionship into your home!',
    procedures: ['Vaccinated', 'Microchipped'],
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
    description:
        'Meet Husky, a spirited 6-year-old dog with a heart full of love and adventure! Husky is an energetic and loyal companion who loves outdoor activities, from long walks to playing fetch. His striking appearance and bright eyes reflect his vibrant personality. Husky is well-trained, intelligent, and gets along wonderfully with other pets and children. If you\'re looking for a devoted and playful friend to join your family, Husky is the perfect match. Adopt Husky today and embark on countless adventures together!',
    procedures: [
      'Vaccinated',
      'Microchipped',
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
    procedures: [],
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
    procedures: [],
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
    procedures: [],
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
    procedures: [],
  ),
  PetCandidateModel(
    id: '7',
    name: 'One, 1',
    job: 'Manager',
    city: 'Town',
    petPics: [
      Constants.logoPath,
    ],
    procedures: [],
  ),
  PetCandidateModel(
    id: '8',
    petType: PetType.dog,
    name: 'Polly  (Paul), 10',
    job: 'Manager',
    city: 'Town',
    petPics: [
      Constants.logoPath,
    ],
    procedures: [],
  ),
];
