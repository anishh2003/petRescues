// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/features/filters/controller/filters_controller.dart';
import 'package:pet_rescues/features/filters/widgets/expansion_tile_options.dart';
import 'package:pet_rescues/features/filters/widgets/filter_button.dart';
import 'package:pet_rescues/features/filters/widgets/pet_filter_toggle.dart';
import 'package:pet_rescues/models/filters_model.dart';
import 'package:pet_rescues/settings/theme_provider.dart';
import 'package:routemaster/routemaster.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  ScrollController myScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var darkTheme = ref.watch(darkThemeProvider);
    var petsToggle = ref.watch(appliedPetsToggleProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Filters',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Show me',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20.0),
                PetFilterToggle(darkTheme: darkTheme),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 360,
                  child: ListView.builder(
                    itemCount: filterMenuOptions.length,
                    itemBuilder: (context, index) {
                      return ExpansionTileOptions(menuIndex: index);
                    },
                  ),
                ),
                const Divider(height: 5),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: FilterButton(
                    lightThemeColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    darkThemeColor: Theme.of(context).colorScheme.tertiary,
                    title: 'Apply filters',
                    onPressed: () {
                      ref.read(appliedPetsToggleProvider.notifier).update(
                          (state) => ref.read(tempSelectedPetsToggleProvider));
                      Routemaster.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: FilterButton(
                    lightThemeColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    darkThemeColor: Theme.of(context).colorScheme.outline,
                    title: 'Clear all',
                    onPressed: () {
                      ref
                          .read(appliedPetsToggleProvider.notifier)
                          .update((state) => PetFilterType.none);
                      Routemaster.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
