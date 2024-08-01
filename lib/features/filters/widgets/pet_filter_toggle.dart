import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/core/providers/filters_provider.dart';

class PetFilterToggle extends ConsumerStatefulWidget {
  const PetFilterToggle({
    super.key,
    required this.darkTheme,
  });

  final bool darkTheme;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PetFilterToggleState();
}

class _PetFilterToggleState extends ConsumerState<PetFilterToggle> {
  int selectedOption = 1;

  void _handleOptionChange(int? value) {
    setState(() {
      selectedOption = value!;
      if (value == PetFilterType.cat.index) {
        ref
            .read(tempSelectedPetsToggleProvider.notifier)
            .update((state) => PetFilterType.cat);
      } else if (value == PetFilterType.dog.index) {
        ref
            .read(tempSelectedPetsToggleProvider.notifier)
            .update((state) => PetFilterType.dog);
      } else {
        ref
            .read(tempSelectedPetsToggleProvider.notifier)
            .update((state) => PetFilterType.none);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: PetToggleOption(
            darkTheme: widget.darkTheme,
            title: 'Cats',
            image: 'assets/images/black_cat_image.jpg',
            selectedOption: selectedOption,
            toggleValue: 1,
            imageScale: 100,
            onChanged: _handleOptionChange,
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: PetToggleOption(
            darkTheme: widget.darkTheme,
            title: 'Dogs',
            image: 'assets/images/black_dog_image.jpg',
            selectedOption: selectedOption,
            toggleValue: 2,
            imageScale: 38,
            onChanged: _handleOptionChange,
          ),
        ),
      ],
    );
  }
}

class PetToggleOption extends StatelessWidget {
  const PetToggleOption({
    super.key,
    required this.darkTheme,
    required this.selectedOption,
    required this.image,
    required this.title,
    required this.toggleValue,
    required this.imageScale,
    required this.onChanged,
  });

  final bool darkTheme;
  final int selectedOption;
  final String image;
  final String title;
  final int toggleValue;
  final double imageScale;
  final ValueChanged<int?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: darkTheme
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.onSurface,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            scale: imageScale,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<int>(
                value: toggleValue,
                groupValue: selectedOption,
                activeColor: darkTheme
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.onSurface,
                fillColor: WidgetStateProperty.all(
                  darkTheme
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.onSurface,
                ),
                onChanged: onChanged,
              ),
              Text(title),
            ],
          )
        ],
      ),
    );
  }
}
