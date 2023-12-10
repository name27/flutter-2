import 'package:flutter/material.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';

class IconProfileAvatar extends StatelessWidget {
  const IconProfileAvatar({
    super.key,
    this.profileUrl,
    this.icon,
  });
  final String? profileUrl;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: Sizes.size28,
        ),
        CircleAvatar(
          radius: Sizes.size24 + Sizes.size2,
          backgroundImage:
              profileUrl != null ? NetworkImage(profileUrl!) : null,
        ),
        icon != null
            ? Positioned(
                right: 0,
                bottom: 0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: Sizes.size14,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: icon!,
                    )
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
