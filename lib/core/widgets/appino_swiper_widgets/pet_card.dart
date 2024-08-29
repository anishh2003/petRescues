import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_rescues/core/constants/constants.dart';
import 'package:pet_rescues/models/pet_candidate_model.dart';

class PetCard extends StatelessWidget {
  final PetCandidateModel candidate;

  const PetCard({
    super.key,
    required this.candidate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CupertinoColors.white,
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Stack(
                children: [
                  Container(
                    width: 400,
                    height: 400,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Stack(
                        children: [
                          Container(
                            child: candidate.petPics?.first == null
                                ? Image.asset(Constants.logoPath)
                                : Image.asset(candidate.petPics!.first),
                          ),
                        ],
                      ),
                    ),
                  ),
                  candidate.distance != null
                      ? Positioned(
                          bottom: -65,
                          left: 5,
                          child: Container(
                            width: 200,
                            height: 200,
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.place,
                                  size: 25,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                                Text(
                                  "${candidate.distance!.toStringAsFixed(2)} miles",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                      ),
                                )
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${candidate.name!} , ${candidate.age}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Size : ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          candidate.size.name,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Gender : ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          candidate.gender.name,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
