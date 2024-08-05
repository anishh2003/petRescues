import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/models/filters_model.dart';
import 'package:pet_rescues/settings/theme_provider.dart';

class RadiusExpansionTileOptions extends ConsumerStatefulWidget {
  const RadiusExpansionTileOptions({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RadiusExpansionTileOptionsState();
}

class _RadiusExpansionTileOptionsState
    extends ConsumerState<RadiusExpansionTileOptions> {
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
        filterMenuOptions[0].title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      children: [
        SizedBox(
          height: 200,
          child: Scrollbar(
            trackVisibility: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filterMenuOptions[0].radiusOptions!.length,
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
                      filterMenuOptions[0].radiusOptions![i].title,
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
