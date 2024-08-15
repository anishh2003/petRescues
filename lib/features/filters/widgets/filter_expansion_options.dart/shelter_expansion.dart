import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/features/filters/controller/filters_controller.dart';
import 'package:pet_rescues/models/filters_model.dart';
import 'package:pet_rescues/models/filters_model.dart';
import 'package:pet_rescues/settings/theme_provider.dart';

class ShelterExpansionTileOptions extends ConsumerStatefulWidget {
  const ShelterExpansionTileOptions({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ShelterExpansionTileOptionsState();
}

class _ShelterExpansionTileOptionsState
    extends ConsumerState<ShelterExpansionTileOptions> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var darkTheme = ref.watch(darkThemeProvider);
    var shelterOptions = ref.watch(tempShelterOptionsProvider);
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
        filterMenuOptions[4].title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      children: [
        SizedBox(
          height: 200,
          child: Scrollbar(
            trackVisibility: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filterMenuOptions[4].shelterOptions!.length,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: Checkbox(
                    value: shelterOptions[i].checkboxValue,
                    onChanged: (bool? value) {
                      ref
                          .read(tempShelterOptionsProvider.notifier)
                          .update((state) {
                        final updatedOptions = [...state];
                        updatedOptions[i] = ShelterOption(
                          title: updatedOptions[i].title,
                          checkboxValue: value ?? false,
                        );
                        return updatedOptions;
                      });
                    },
                  ),
                  title: Text(
                    filterMenuOptions[4].shelterOptions![i].title,
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
