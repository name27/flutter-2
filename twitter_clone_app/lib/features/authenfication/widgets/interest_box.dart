import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_app/constants/colors.dart';
import 'package:twitter_clone_app/constants/sizes.dart';

class InterestBox extends StatelessWidget {
  const InterestBox({
    super.key,
    required this.interest,
    required this.selected,
  });

  final String interest;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.48,
      child: Container(
        padding: const EdgeInsets.only(
          top: Sizes.size8,
          bottom: Sizes.size10,
          left: Sizes.size12,
          right: Sizes.size8,
        ),
        decoration: BoxDecoration(
          color: selected ? MyColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(Sizes.size14),
          border: Border.all(color: MyColors.lightGrey),
        ),
        child: SizedBox(
          height: Sizes.size64,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    color: Colors.white,
                  ),
                ],
              ),
              Text(
                interest,
                style: TextStyle(
                  color: selected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: Sizes.size20,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
