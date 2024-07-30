// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/features/filters/widgets/pet_filter_toggle.dart';
import 'package:pet_rescues/models/filters_model.dart';
import 'package:pet_rescues/settings/theme_provider.dart';

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
                  height: 500,
                  child: ListView.builder(
                    itemCount: filterMenuOptions.length,
                    itemBuilder: (context, index) {
                      return ExpansionTileOptions(menuIndex: index);
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

class ExpansionTileOptions extends StatefulWidget {
  const ExpansionTileOptions({
    super.key,
    required this.menuIndex,
  });

  final int menuIndex;

  @override
  State<ExpansionTileOptions> createState() => _ExpansionTileOptionsState();
}

class _ExpansionTileOptionsState extends State<ExpansionTileOptions> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedAlignment: Alignment.centerLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      title: Text(
        filterMenuOptions[widget.menuIndex].title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      children: [
        SizedBox(
          height: 200,
          child: Scrollbar(
            trackVisibility: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filterMenuOptions[widget.menuIndex].options.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      index = i;
                    });
                  },
                  child: ListTile(
                    leading: index == i
                        ? const Icon(Icons.check_box)
                        : const Icon(Icons.check_box_outline_blank),
                    title: Text(
                        filterMenuOptions[widget.menuIndex].options[i].title),
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
