// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pet_rescues/models/filters_model.dart';
// import 'package:pet_rescues/settings/theme_provider.dart';

// class ExpansionTileOptions extends ConsumerStatefulWidget {
//   const ExpansionTileOptions({required this.menuIndex, super.key});
//   final int menuIndex;
//   // final FilterMenuOption filterMenuOption;
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _ExpansionTileOptionsState();
// }

// class _ExpansionTileOptionsState extends ConsumerState<ExpansionTileOptions> {
//   int index = 0;


//  @override
//   void initState() {
//     // index = ref.read(appliedPetsToggleProvider.notifier).state.index;
//     super.initState();
//   }


//   @override
//   Widget build(BuildContext context) {
//     var darkTheme = ref.watch(darkThemeProvider);
//     return ExpansionTile(
//       expandedAlignment: Alignment.centerLeft,
//       expandedCrossAxisAlignment: CrossAxisAlignment.start,
//       iconColor: darkTheme
//           ? Theme.of(context).colorScheme.primaryContainer
//           : Theme.of(context).colorScheme.onSurface,
//       collapsedIconColor: darkTheme
//           ? Theme.of(context).colorScheme.primaryContainer
//           : Theme.of(context).colorScheme.onSurface,
//       title: Text(
//         filterMenuOptions[widget.menuIndex].title,
//         style: Theme.of(context).textTheme.headlineSmall,
//       ),
//       children: [
//         SizedBox(
//           height: 200,
//           child: Scrollbar(
//             trackVisibility: true,
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: filterMenuOptions[widget.menuIndex].options.length,
//               itemBuilder: (context, i) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       index = i;
//                     });
//                   },
//                   child: ListTile(
//                     leading: index == i
//                         ? Icon(
//                             Icons.check_box,
//                             color: darkTheme
//                                 ? Theme.of(context).colorScheme.primaryContainer
//                                 : Theme.of(context).colorScheme.onSurface,
//                           )
//                         : Icon(
//                             Icons.check_box_outline_blank,
//                             color: darkTheme
//                                 ? Theme.of(context).colorScheme.primaryContainer
//                                 : Theme.of(context).colorScheme.onSurface,
//                           ),
//                     title: Text(
//                       filterMenuOptions[widget.menuIndex].options[i].title,
//                       style: Theme.of(context).textTheme.bodyMedium,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
