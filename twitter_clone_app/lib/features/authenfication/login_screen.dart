import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_app/constants/design/colors.dart';
import 'package:twitter_clone_app/constants/design/gaps.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';
import 'package:twitter_clone_app/features/authenfication/sign_up_screen.dart';
import 'package:twitter_clone_app/features/authenfication/widgets/login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void goSignUpScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (contex) => const SignUpScreen()));
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
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.v96,
              const Text(
                "See what's happening in the world right now.",
                style: TextStyle(
                  fontSize: Sizes.size28 + Sizes.size2,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Gaps.v96,
              LoginButton(
                leading: SvgPicture.asset(
                  'assets/images/google.svg',
                  width: Sizes.size20 + Sizes.size2,
                  height: Sizes.size20 + Sizes.size2,
                ),
                text: 'Continue with Google',
              ),
              Gaps.v14,
              const LoginButton(
                leading: FaIcon(
                  FontAwesomeIcons.apple,
                  size: Sizes.size24,
                ),
                text: 'Continue with Apple',
              ),
              Gaps.v10,
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration:
                            const BoxDecoration(color: MyColors.lightGrey),
                        height: 0.4,
                      ),
                    ),
                    Gaps.h7,
                    const Text(
                      "or",
                    ),
                    Gaps.h7,
                    Expanded(
                      child: Container(
                        decoration:
                            const BoxDecoration(color: MyColors.lightGrey),
                        height: 0.4,
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.v10,
              LoginButton(
                onTap: () => goSignUpScreen(context),
                text: 'Create account',
                bgColor: Colors.black,
                textColor: Colors.white,
              ),
              Gaps.v20,
              const Text(
                  'By signing up, you agree to our Terms, Privacy Policy, and Cookie Use')
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
          elevation: 0,
          child: Row(
            children: [
              Text(
                'Have an account already?',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gaps.h4,
              Text(
                'Log in',
                style: TextStyle(
                  color: MyColors.primary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )),
    );
  }
}
