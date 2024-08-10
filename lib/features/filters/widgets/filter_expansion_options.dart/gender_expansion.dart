import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/features/filters/controller/filters_controller.dart';
import 'package:pet_rescues/models/filters_model.dart';
import 'package:pet_rescues/settings/theme_provider.dart';

class GenderExpansionTileOptions extends ConsumerStatefulWidget {
  const GenderExpansionTileOptions({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GenderExpansionTileOptionsState();
}

class _GenderExpansionTileOptionsState
    extends ConsumerState<GenderExpansionTileOptions> {
  @override
  Widget build(BuildContext context) {
    var darkTheme = ref.watch(darkThemeProvider);
    var genderOptions = ref.watch(tempGenderSelectedProvider);

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
        filterMenuOptions[2].title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      children: [
        SizedBox(
          height: 120,
          child: Scrollbar(
            trackVisibility: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filterMenuOptions[2].genderOptions!.length,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: Checkbox(
                    value: genderOptions[i].checkboxValue,
                    onChanged: (bool? value) {
                      ref
                          .read(tempGenderSelectedProvider.notifier)
                          .update((state) {
                        final updatedOptions = [...state];
                        updatedOptions[i] = GenderOption(
                          title: updatedOptions[i].title,
                          checkboxValue: value ?? false,
                        );
                        return updatedOptions;
                      });
                    },
                  ),
                  title: Text(
                    filterMenuOptions[2].genderOptions![i].title,
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
