import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone_app/constants/design/colors.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';
import 'package:twitter_clone_app/features/home/widgets/text_tile.dart';

class ReportBottomSheet extends StatelessWidget {
  const ReportBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      padding: const EdgeInsets.only(
        top: Sizes.size32,
        bottom: Sizes.size20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Sizes.size20),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Why are you reporting this thread?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.size20,
                    ),
                  ),
                  Text(
                    "Your report is anonymous, except if you're reporting an intellectual property infingement. if someone is in inmmediate danger, call the local emergency sevice - don't wait.",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      color: MyColors.lightGrey,
                    ),
                  ),
                ],
              ),
            ),
            const TextTile(text: "I just don't like it"),
            const TextTile(text: "It's unlawful content under NetzDG"),
            const TextTile(text: "It's spam"),
            const TextTile(text: "Hate speech or symbolst"),
            const TextTile(text: "Nudity ore sexual activit"),
            TextTile(text: faker.lorem.sentence()),
          ],
        ),
      ),
    );
  }
}
