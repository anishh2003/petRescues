import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/settings/theme_provider.dart';

class FilterButton extends ConsumerWidget {
  const FilterButton({
    required this.title,
    required this.lightThemeColor,
    required this.darkThemeColor,
    required this.onPressed,
    super.key,
  });

  final String title;
  final Color lightThemeColor;
  final Color darkThemeColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkTheme = ref.watch(darkThemeProvider);
    return SizedBox(
      width: 250,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            side: BorderSide(
              color: darkTheme ? darkThemeColor : lightThemeColor,
              width: 5,
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          backgroundColor: darkTheme ? darkThemeColor : lightThemeColor,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
