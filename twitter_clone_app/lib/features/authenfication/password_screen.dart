import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_app/constants/colors.dart';
import 'package:twitter_clone_app/constants/gaps.dart';
import 'package:twitter_clone_app/constants/sizes.dart';
import 'package:twitter_clone_app/features/authenfication/interest_screen.dart';
import 'package:twitter_clone_app/features/authenfication/widgets/custom_textformfield.dart';
import 'package:twitter_clone_app/features/authenfication/widgets/login_button.dart';

class PassWordScreen extends StatefulWidget {
  const PassWordScreen({super.key});

  @override
  State<PassWordScreen> createState() => _EmailCodeScreenState();
}

class _EmailCodeScreenState extends State<PassWordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTextController = TextEditingController();
  bool _isobscureText = true;

  void _goInterestScreen() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const InterestScreen()),
        (route) => false);
  }

  String? _passwordValid(String? value) {
    if (value == null) {
      return 'Please your password';
    } else if (value.length > 7) {
      return null;
    }
    return 'Password must be at least 8 characters long';
  }

  bool passwordValid() {
    if (_formKey.currentState != null) {
      return _formKey.currentState!.validate();
    }
    return false;
  }

  void unfocusKeyboard() {
    FocusScope.of(context).unfocus();
  }

  void _obscurePassword() {
    _isobscureText = !_isobscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: unfocusKeyboard,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const FaIcon(
            FontAwesomeIcons.twitter,
            color: MyColors.primary,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20, vertical: Sizes.size16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "You'll need a password",
                      style: TextStyle(
                        fontSize: Sizes.size28 + Sizes.size2,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Gaps.v10,
                    const Text(
                      "Make sure it's 8 character or more",
                      style: TextStyle(
                          fontSize: Sizes.size14, color: Colors.black87),
                    ),
                    Gaps.v10,
                    CustomTextFormField(
                      isCheck:
                          _passwordValid(_passwordTextController.text) == null,
                      hintText: 'Password',
                      labelText: 'Password',
                      controller: _passwordTextController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) => _passwordValid(value),
                      onSaved: (value) => _passwordValid(value),
                      obscureText: _isobscureText,
                      onChanged: (value) {
                        setState(() {});
                      },
                      trailingSuffix: GestureDetector(
                        onTap: _obscurePassword,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: _isobscureText
                                  ? Sizes.size3 + 0.5
                                  : Sizes.size6),
                          child: _isobscureText
                              ? const FaIcon(
                                  FontAwesomeIcons.eyeSlash,
                                  size: Sizes.size20,
                                  color: MyColors.lightGrey,
                                )
                              : const FaIcon(
                                  FontAwesomeIcons.eye,
                                  size: Sizes.size20,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gaps.v6,
                LoginButton(
                  onTap: _goInterestScreen,
                  text: 'Next',
                  bgColor: passwordValid() ? Colors.black : Colors.black45,
                  textColor:
                      passwordValid() ? Colors.white : MyColors.lightGrey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
