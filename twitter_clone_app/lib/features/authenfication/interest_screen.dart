import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_app/constants/design/colors.dart';
import 'package:twitter_clone_app/constants/design/gaps.dart';
import 'package:twitter_clone_app/constants/interest.dart';
import 'package:twitter_clone_app/constants/my_interests.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';
import 'package:twitter_clone_app/features/authenfication/interest_detail_screen.dart';
import 'package:twitter_clone_app/features/authenfication/widgets/interest_box.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  void _addMyInteres(String interest) {
    if (MyInterests.myInterest.contains(interest)) {
      MyInterests.myInterest.remove(interest);
    } else if (MyInterests.myInterest.length < 3) {
      MyInterests.myInterest.add(interest);
    }
    setState(() {});
  }

  void _goInterestDetailScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const InterestDetailScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          color: MyColors.primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20, vertical: Sizes.size16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Whqt do you want to see on Twitter",
                style: TextStyle(
                  fontSize: Sizes.size28 + Sizes.size2,
                  fontWeight: FontWeight.w900,
                  height: 1.2,
                ),
              ),
              Gaps.v10,
              const Text(
                "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                style: TextStyle(fontSize: Sizes.size16, color: Colors.black87),
              ),
              Gaps.v20,
              Container(
                decoration: const BoxDecoration(color: MyColors.lightGrey),
                height: 0.4,
              ),
              Gaps.v32,
              Wrap(
                runSpacing: Sizes.size8,
                spacing: Sizes.size10,
                children: [
                  for (var interest in Interests.interest)
                    GestureDetector(
                      onTap: () => _addMyInteres(interest),
                      child: InterestBox(
                        interest: interest,
                        selected: MyInterests.myInterest.contains(interest),
                      ),
                    ),
                ],
              ),
              Gaps.v20,
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyInterests.myInterest.length == 3
                ? const Text('Great work')
                : Text('${MyInterests.myInterest.length} of 3 selected'),
            GestureDetector(
              onTap: _goInterestDetailScreen,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size16,
                  vertical: Sizes.size8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.size20),
                  color: MyInterests.myInterest.length == 3
                      ? Colors.black
                      : Colors.black54,
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: MyInterests.myInterest.length == 3
                        ? Colors.white
                        : MyColors.lightGrey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
