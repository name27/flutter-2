import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_app/constants/colors.dart';
import 'package:twitter_clone_app/constants/gaps.dart';
import 'package:twitter_clone_app/constants/interest_detail.dart';
import 'package:twitter_clone_app/constants/my_interests.dart';
import 'package:twitter_clone_app/constants/sizes.dart';
import 'package:twitter_clone_app/features/authenfication/widgets/intereest_detail_box.dart';
import 'package:twitter_clone_app/features/home/home_screen.dart';

class InterestDetailScreen extends StatefulWidget {
  const InterestDetailScreen({super.key});

  @override
  State<InterestDetailScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestDetailScreen> {
  int myDetailLength = 0;

  void _addMyInteresDetail(String interest, String detail) {
    List myKey = MyInterests.myInterestDetail[interest];
    if (myKey.contains(detail)) {
      MyInterests.myInterestDetail[interest].remove(detail);
      myDetailLength--;
    } else if (myKey.length < 12) {
      MyInterests.myInterestDetail[interest].add(detail);
      myDetailLength++;
    }
    setState(() {});
  }

  void _goHomeScreen() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false);
  }

  @override
  void initState() {
    super.initState();
    for (var key in MyInterests.myInterest) {
      MyInterests.myInterestDetail[key] = [];
    }
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
                "Interests are used to personalize your \n experience and will be visible on your profile",
                style: TextStyle(fontSize: Sizes.size16, color: Colors.black87),
              ),
              Gaps.v20,
              Container(
                decoration: const BoxDecoration(color: MyColors.lightGrey),
                height: 0.4,
              ),
              Gaps.v32,
              for (var myKey in MyInterests.myInterest)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v10,
                    Text(
                      myKey,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.size24,
                      ),
                    ),
                    Gaps.v16,
                    SizedBox(
                      height: 210,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            width: 1000,
                            height: 210,
                            child: Wrap(
                              spacing: Sizes.size10,
                              runSpacing: Sizes.size10,
                              children: [
                                for (var detail
                                    in InterestDetails.interestDetails[myKey])
                                  GestureDetector(
                                    onTap: () =>
                                        _addMyInteresDetail(myKey, detail),
                                    child: InterestDetailBox(
                                      interest: detail,
                                      selected: MyInterests
                                          .myInterestDetail[myKey]
                                          .contains(detail),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: _goHomeScreen,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size16,
                  vertical: Sizes.size8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.size20),
                  color: myDetailLength > 2 ? Colors.black : Colors.black54,
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color:
                        myDetailLength > 2 ? Colors.white : MyColors.lightGrey,
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
