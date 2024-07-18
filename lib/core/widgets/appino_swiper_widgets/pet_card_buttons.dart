import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:appinio_swiper/appinio_swiper.dart';

//swipe card to the right side
Widget swipeRightButton(AppinioSwiperController controller) {
  // We can listen to the controller to get updated as the card shifts position!
  return ListenableBuilder(
    listenable: controller,
    builder: (context, child) {
      final SwiperPosition? position = controller.position;
      final SwiperActivity? activity = controller.swipeActivity;
      // Lets measure the progress of the swipe iff it is a horizontal swipe.
      final double progress = (activity is Swipe || activity == null) &&
              position != null &&
              position.offset.toAxisDirection().isHorizontal
          ? position.progressRelativeToThreshold.clamp(-1, 1)
          : 0;
      // Lets animate the button according to the
      // progress. Here we'll color the button more grey as we swipe away from
      // it.
      final Color color = Color.lerp(
        CupertinoColors.activeGreen,
        CupertinoColors.systemGrey2,
        (-1 * progress).clamp(0, 1),
      )!;
      return GestureDetector(
        onTap: () => controller.swipeRight(),
        child: Transform.scale(
          scale: 1 + .1 * progress.clamp(0, 1),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.favorite_border,
              color: CupertinoColors.white,
              size: 40,
            ),
          ),
        ),
      );
    },
  );
}

//swipe card to the left side
Widget swipeLeftButton(AppinioSwiperController controller) {
  return ListenableBuilder(
    listenable: controller,
    builder: (context, child) {
      final SwiperPosition? position = controller.position;
      final SwiperActivity? activity = controller.swipeActivity;
      final double horizontalProgress =
          (activity is Swipe || activity == null) &&
                  position != null &&
                  position.offset.toAxisDirection().isHorizontal
              ? -1 * position.progressRelativeToThreshold.clamp(-1, 1)
              : 0;
      final Color color = Color.lerp(
        const Color(0xFFFF3868),
        CupertinoColors.systemGrey2,
        (-1 * horizontalProgress).clamp(0, 1),
      )!;
      return GestureDetector(
        onTap: () => controller.swipeLeft(),
        child: Transform.scale(
          // Increase the button size as we swipe towards it.
          scale: 1 + .1 * horizontalProgress.clamp(0, 1),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.close,
              color: CupertinoColors.white,
            ),
          ),
        ),
      );
    },
  );
}

//unswipe card
Widget unswipeButton(AppinioSwiperController controller) {
  return GestureDetector(
    onTap: () => controller.unswipe(),
    child: Container(
      height: 60,
      width: 60,
      alignment: Alignment.center,
      child: Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          color: CupertinoColors.systemGrey2,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.undo,
          color: CupertinoColors.white,
        ),
      ),
    ),
  );
}
