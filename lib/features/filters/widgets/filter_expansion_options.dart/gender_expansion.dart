import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  int index = 0;

  @override
  void initState() {
    // index = ref.read(appliedPetsToggleProvider.notifier).state.index;
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
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      index = i;
                    });
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
                      filterMenuOptions[2].genderOptions![i].title,
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
