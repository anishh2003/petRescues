import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/features/filters/controller/filters_controller.dart';
import 'package:pet_rescues/models/filters_model.dart';
import 'package:pet_rescues/settings/theme_provider.dart';

class AgeExpansionTileOptions extends ConsumerStatefulWidget {
  const AgeExpansionTileOptions({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AgeExpansionTileOptionsState();
}

class _AgeExpansionTileOptionsState
    extends ConsumerState<AgeExpansionTileOptions> {
  @override
  Widget build(BuildContext context) {
    var darkTheme = ref.watch(darkThemeProvider);
    var ageOptions = ref.watch(tempAgeSelectedProvider);
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
        filterMenuOptions[3].title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      children: [
        SizedBox(
          height: 200,
          child: Scrollbar(
            trackVisibility: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filterMenuOptions[3].ageOptions!.length,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: Checkbox(
                    value: ageOptions[i].checkboxValue,
                    onChanged: (bool? value) {
                      ref
                          .read(tempAgeSelectedProvider.notifier)
                          .update((state) {
                        final updatedOptions = [...state];
                        updatedOptions[i] = AgeOption(
                          title: updatedOptions[i].title,
                          checkboxValue: value ?? false,
                        );
                        return updatedOptions;
                      });
                    },
                  ),
                  title: Text(
                    filterMenuOptions[3].ageOptions![i].title,
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
