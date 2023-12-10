import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_app/constants/design/colors.dart';
import 'package:twitter_clone_app/constants/design/gaps.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';
import 'package:twitter_clone_app/controller/signup_controller.dart';
import 'package:twitter_clone_app/features/authenfication/sign_up_screen.dart';
import 'package:twitter_clone_app/features/authenfication/widgets/login_button.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({super.key});

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  int value = 0;

  void _goSignUpScreen() {
    if (value != 0) {
      SignUpController.isCustomizeCheck = true;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()));
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
        child: Column(
          children: [
            const Text(
              'Customize your experience',
              style: TextStyle(
                  fontSize: Sizes.size28 + Sizes.size2,
                  fontWeight: FontWeight.w900,
                  height: 1.2),
            ),
            Gaps.v16,
            const Text(
              'Track where you see Twitter content across the web',
              style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w900,
                  height: 1.2),
            ),
            Gaps.v16,
            Row(
              children: [
                const Flexible(
                  child: Text(
                    'Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.',
                    style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w800,
                        height: 1.2),
                  ),
                ),
                Gaps.h8,
                AnimatedToggleSwitch<int>.rolling(
                  indicatorSize: const Size.fromWidth(Sizes.size28),
                  height: Sizes.size32,
                  current: value,
                  values: const [0, 1],
                  onChanged: (i) => setState(() => value = i),
                  iconBuilder: (value, isbool) {
                    return const SizedBox();
                  },
                  // iconList: [...], you can use iconBuilder, customIconBuilder or iconList
                  style: ToggleStyle(
                      borderColor: Colors.transparent,
                      backgroundColor:
                          value == 0 ? MyColors.lightGrey : Colors.green,
                      indicatorColor: Colors.white), // optional style settings
                  // many more parameters available
                ),
              ],
            ),
            Gaps.v28,
            const Text(
              'By signing up, your agree to our Terms, Privacy Policy, and Cookie Use. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. Learn more',
              style: TextStyle(
                fontSize: Sizes.size14,
                color: Colors.black54,
                height: 1.35,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: LoginButton(
          onTap: _goSignUpScreen,
          text: 'Next',
          bgColor: value == 1 ? Colors.black : MyColors.lightGrey,
          textColor: value == 1 ? Colors.white : Colors.black38,
        ),
      ),
    );
  }
}
