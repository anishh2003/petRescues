import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/features/filters/controller/filters_controller.dart';
import 'package:pet_rescues/models/filters_model.dart';
import 'package:pet_rescues/settings/theme_provider.dart';

class DontShowExpansionTileOptions extends ConsumerStatefulWidget {
  const DontShowExpansionTileOptions({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DontShowExpansionTileOptionsState();
}

class _DontShowExpansionTileOptionsState
    extends ConsumerState<DontShowExpansionTileOptions> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var darkTheme = ref.watch(darkThemeProvider);
    var dontShowOptions = ref.watch(tempDontShowOptionsProvider);
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
        filterMenuOptions[5].title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      children: [
        SizedBox(
          height: 200,
          child: Scrollbar(
            trackVisibility: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filterMenuOptions[5].dontShowOptions!.length,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: Checkbox(
                    value: dontShowOptions[i].checkboxValue,
                    onChanged: (bool? value) {
                      ref
                          .read(tempDontShowOptionsProvider.notifier)
                          .update((state) {
                        final updatedOptions = [...state];
                        updatedOptions[i] = DontShowOption(
                          title: updatedOptions[i].title,
                          checkboxValue: value ?? false,
                        );
                        return updatedOptions;
                      });
                    },
                  ),
                  title: Text(
                    filterMenuOptions[5].dontShowOptions![i].title,
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
