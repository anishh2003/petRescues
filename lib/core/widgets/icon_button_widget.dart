import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final Color color;
  final IconData icon;
  const IconButtonWidget({
    required this.onPressed,
    required this.color,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        margin: const EdgeInsets.all(1),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          border: Border.all(
            color: color,
            width: 2,
          ),
        ),
        child: Icon(
          icon,
          size: 25.0,
          color: color,
        ),
      ),
    );
  }
}
