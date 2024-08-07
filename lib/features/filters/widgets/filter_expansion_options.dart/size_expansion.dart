import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/features/filters/controller/filters_controller.dart';
import 'package:pet_rescues/models/filters_model.dart';
import 'package:pet_rescues/models/pet_candidate_model.dart';
import 'package:pet_rescues/settings/theme_provider.dart';

class SizeExpansionTileOptions extends ConsumerStatefulWidget {
  const SizeExpansionTileOptions({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SizeExpansionTileOptionsState();
}

class _SizeExpansionTileOptionsState
    extends ConsumerState<SizeExpansionTileOptions> {
  late int index;

  @override
  void initState() {
    index = ref.read(appliedSizeFilterProvider.notifier).state.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var darkTheme = ref.watch(darkThemeProvider);
    return ExpansionTile(
      expandedAlignment: Alignment.centerLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      iconColor: darkTheme
          ? Theme.of(context).colorScheme.primaryContainer
          : Theme.of(context).colorScheme.onSurface,
      collapsedIconColor: darkTheme
          ? Theme.of(context).colorScheme.primaryContainer
          : Theme.of(context).colorScheme.onSurface,
      title: Text(
        filterMenuOptions[1].title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      children: [
        SizedBox(
          height: 20,
          child: Scrollbar(
            trackVisibility: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filterMenuOptions[1].animalSizeOptions!.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      index = i;
                    });
                    //set temporary gender value
                    ref.read(tempSizeSelectedProvider.notifier).update((item) =>
                        item = AnimalSize.values
                            .firstWhere((e) => e.index == index));
                  },
                  child: ListTile(
                    leading: index == i
                        ? Icon(
                            Icons.check_box,
                            color: darkTheme
                                ? Theme.of(context).colorScheme.primaryContainer
                                : Theme.of(context).colorScheme.onSurface,
                          )
                        : Icon(
                            Icons.check_box_outline_blank,
                            color: darkTheme
                                ? Theme.of(context).colorScheme.primaryContainer
                                : Theme.of(context).colorScheme.onSurface,
                          ),
                    title: Text(
                      filterMenuOptions[1].animalSizeOptions![i].title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
