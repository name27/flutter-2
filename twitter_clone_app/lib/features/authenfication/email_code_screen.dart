import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_app/constants/design/colors.dart';
import 'package:twitter_clone_app/constants/design/gaps.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';
import 'package:twitter_clone_app/controller/signup_controller.dart';
import 'package:twitter_clone_app/features/authenfication/password_screen.dart';
import 'package:twitter_clone_app/features/authenfication/widgets/login_button.dart';
import 'package:twitter_clone_app/features/authenfication/widgets/one_textfield.dart';

class EmailCodeScreen extends StatefulWidget {
  const EmailCodeScreen({super.key});

  @override
  State<EmailCodeScreen> createState() => _EmailCodeScreenState();
}

class _EmailCodeScreenState extends State<EmailCodeScreen> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourthController = TextEditingController();
  final TextEditingController _fifthController = TextEditingController();
  final TextEditingController _sixthController = TextEditingController();
  final FocusNode _firstFocusNode = FocusNode();
  final FocusNode _secondFocusNode = FocusNode();
  final FocusNode _thirdFocusNode = FocusNode();
  final FocusNode _fourthFocusNode = FocusNode();
  final FocusNode _fifthFocusNode = FocusNode();
  final FocusNode _sixthFocusNode = FocusNode();

  late String _theCode;
  bool _isCorrect = false;

  @override
  void initState() {
    super.initState();
    SignUpController.auth['email'] = "clover0test@gmail.com";
    _firstController.addListener(() {
      if (_firstController.text.length == 1) {
        _secondFocusNode.requestFocus();
      }
    });
    _secondController.addListener(() {
      if (_secondController.text.length == 1) {
        _thirdFocusNode.requestFocus();
      }
    });
    _thirdController.addListener(() {
      if (_thirdController.text.length == 1) {
        _fourthFocusNode.requestFocus();
      }
    });
    _fourthController.addListener(() {
      if (_fourthController.text.length == 1) {
        _fifthFocusNode.requestFocus();
      }
    });
    _fifthController.addListener(() {
      if (_fifthController.text.length == 1) {
        _sixthFocusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    _fifthFocusNode.dispose();
    _sixthFocusNode.dispose();

    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();
    _fifthController.dispose();
    _sixthController.dispose();
    super.dispose();
  }

  void _goPasswordScreen(BuildContext context) {
    _isCorrect
        ? Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const PassWordScreen()),
            (route) => false)
        : null;
  }

  void _unfocusKeyboard() {
    FocusScope.of(context).unfocus();
  }

  void _codeCheck(String value) {
    _codeString();
    _theCode == "122456" ? _isCorrect = true : _isCorrect = false;
    setState(() {});
  }

  void _codeString() {
    _theCode = _firstController.text +
        _secondController.text +
        _thirdController.text +
        _fourthController.text +
        _fifthController.text +
        _sixthController.text;
    print(_theCode);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocusKeyboard,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'We sent you a code',
                    style: TextStyle(
                      fontSize: Sizes.size28 + Sizes.size2,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Gaps.v10,
                  Text(
                    "Enter it below to verify\n${SignUpController.auth['email'] ?? ''}.",
                    style: const TextStyle(
                        fontSize: Sizes.size14, color: Colors.black87),
                  ),
                  Row(
                    children: [
                      OneTextfield(
                        controller: _firstController,
                        focusNode: _firstFocusNode,
                        onChanged: (value) => _codeCheck(value),
                      ),
                      Gaps.h16,
                      OneTextfield(
                        controller: _secondController,
                        focusNode: _secondFocusNode,
                        onChanged: (value) => _codeCheck(value),
                      ),
                      Gaps.h16,
                      OneTextfield(
                        controller: _thirdController,
                        focusNode: _thirdFocusNode,
                        onChanged: (value) => _codeCheck(value),
                      ),
                      Gaps.h16,
                      OneTextfield(
                        controller: _fourthController,
                        focusNode: _fourthFocusNode,
                        onChanged: (value) => _codeCheck(value),
                      ),
                      Gaps.h16,
                      OneTextfield(
                        controller: _fifthController,
                        focusNode: _fifthFocusNode,
                        onChanged: (value) => _codeCheck(value),
                      ),
                      Gaps.h16,
                      OneTextfield(
                        controller: _sixthController,
                        focusNode: _sixthFocusNode,
                        onChanged: (value) => _codeCheck(value),
                      ),
                    ],
                  ),
                  Gaps.v20,
                  _isCorrect
                      ? const Center(
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleCheck,
                            color: Colors.green,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Didn't receive email?",
                    style: TextStyle(color: MyColors.primary),
                  ),
                  Gaps.v6,
                  LoginButton(
                    onTap: () => _goPasswordScreen(context),
                    text: 'Next',
                    bgColor: _isCorrect ? Colors.black : Colors.black45,
                    textColor: _isCorrect ? Colors.white : MyColors.lightGrey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
