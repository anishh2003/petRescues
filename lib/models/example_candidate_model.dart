import 'package:flutter/cupertino.dart';

class PetCandidateModel {
  String? name;
  String? job;
  String? city;
  LinearGradient? color;

  PetCandidateModel({
    this.name,
    this.job,
    this.city,
    this.color,
  });
}

List<PetCandidateModel> candidates = [
  PetCandidateModel(
    name: 'Eight, 8',
    job: 'Manager',
    city: 'Town',
    color: gradientPink,
  ),
  PetCandidateModel(
    name: 'Seven, 7',
    job: 'Manager',
    city: 'Town',
    color: gradientBlue,
  ),
  PetCandidateModel(
    name: 'Six, 6',
    job: 'Manager',
    city: 'Town',
    color: gradientPurple,
  ),
  PetCandidateModel(
    name: 'Five, 5',
    job: 'Manager',
    city: 'Town',
    color: gradientRed,
  ),
  PetCandidateModel(
    name: 'Four, 4',
    job: 'Manager',
    city: 'Town',
    color: gradientPink,
  ),
  PetCandidateModel(
    name: 'Three, 3',
    job: 'Manager',
    city: 'Town',
    color: gradientBlue,
  ),
  PetCandidateModel(
    name: 'Two, 2',
    job: 'Manager',
    city: 'Town',
    color: gradientPurple,
  ),
  PetCandidateModel(
    name: 'One, 1',
    job: 'Manager',
    city: 'Town',
    color: gradientRed,
  ),
];

const LinearGradient gradientRed = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFF3868),
    Color(0xFFFFB49A),
  ],
);

const LinearGradient gradientPurple = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF736EFE),
    Color(0xFF62E4EC),
  ],
);

const LinearGradient gradientBlue = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF0BA4E0),
    Color(0xFFA9E4BD),
  ],
);

const LinearGradient gradientPink = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFF6864),
    Color(0xFFFFB92F),
  ],
);

const LinearGradient kNewFeedCardColorsIdentityGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF7960F1),
    Color(0xFFE1A5C9),
  ],
);
