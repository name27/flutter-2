import 'package:flutter/material.dart';
import 'package:twitter_clone_app/constants/colors.dart';
import 'package:twitter_clone_app/constants/sizes.dart';

class InterestDetailBox extends StatelessWidget {
  const InterestDetailBox({
    super.key,
    required this.interest,
    required this.selected,
  });

  final String interest;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size10,
        vertical: Sizes.size10,
      ),
      decoration: BoxDecoration(
        color: selected ? MyColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(Sizes.size24),
        border: Border.all(color: MyColors.lightGrey),
      ),
      child: Text(
        interest,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: Sizes.size20,
          height: 1,
        ),
      ),
    );
  }
}
