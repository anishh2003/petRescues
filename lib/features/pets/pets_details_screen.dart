import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/core/providers/common_provider.dart';
import 'package:pet_rescues/core/widgets/icon_button_widget.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400.0,
              width: 400.0,
              child: Swiper(
                itemBuilder: (context, index) {
                  return FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset(
                      pet.petPics![index],
                    ),
                  );
                },
                indicatorLayout: PageIndicatorLayout.SCALE,
                itemCount: pet.petPics!.length,
                pagination: const SwiperPagination(),
                curve: Curves.easeIn,
                loop: false,
                viewportFraction: 1.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButtonWidget(
                  color: Colors.red,
                  icon: Icons.close,
                  onPressed: () {},
                ),
                IconButtonWidget(
                  color: Colors.orange,
                  icon: Icons.share,
                  onPressed: () {},
                ),
                IconButtonWidget(
                  color: Colors.green,
                  icon: Icons.favorite_outline,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pet.name ?? '',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    pet.description ?? '',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20.0),
                  pet.procedures!.isEmpty
                      ? const SizedBox(height: 0)
                      : Container(
                          width: 140,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.green,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: pet.procedures!.length,
                            itemBuilder: (context, index) {
                              return Text(
                                pet.procedures![index],
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: Colors.green),
                              );
                            },
                          ),
                        ),
                  const SizedBox(height: 10),
                  pet.bubbleOptions!.isEmpty
                      ? const SizedBox(height: 10)
                      : SizedBox(
                          height: 300.0,
                          width: 200,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: pet.bubbleOptions!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: pet.bubbleOptions![index]
                                          .confidenceColor!,
                                      width: 3.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      pet.bubbleOptions![index].text!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                              color: pet.bubbleOptions![index]
                                                  .confidenceColor!),
                                    ),
                                  ),
                                );
                              }),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
