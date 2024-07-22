import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Hello there. Pet id is : ${widget.petId}")),
    );
  }
}
