import 'package:flutter/material.dart';
import 'package:twitter_clone_app/constants/design/colors.dart';
import 'package:twitter_clone_app/constants/design/gaps.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    this.leading,
    required this.text,
    this.bgColor,
    this.textColor,
    this.onTap,
  });
  final Widget? leading;
  final String text;
  final Color? bgColor;
  final Color? textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: Sizes.size12),
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: MyColors.lightGrey),
            borderRadius: BorderRadius.circular(Sizes.size28),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: Sizes.size44),
                  child: leading,
                ),
              ),
              Gaps.h10,
              Text(
                text,
                style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
