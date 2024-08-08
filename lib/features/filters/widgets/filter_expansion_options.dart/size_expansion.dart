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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var darkTheme = ref.watch(darkThemeProvider);
    var sizeOptions = ref.watch(tempSizeSelectedProvider);
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
          height: 200,
          child: Scrollbar(
            trackVisibility: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filterMenuOptions[1].animalSizeOptions!.length,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: Checkbox(
                    value: sizeOptions[i].checkboxValue,
                    onChanged: (bool? value) {
                      ref
                          .read(tempSizeSelectedProvider.notifier)
                          .update((state) {
                        final updatedOptions = [...state];
                        updatedOptions[i] = AnimalSizeOption(
                          title: updatedOptions[i].title,
                          checkboxValue: value ?? false,
                        );
                        return updatedOptions;
                      });
                    },
                  ),
                  title: Text(
                    filterMenuOptions[1].animalSizeOptions![i].title,
                    style: Theme.of(context).textTheme.bodyMedium,
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
