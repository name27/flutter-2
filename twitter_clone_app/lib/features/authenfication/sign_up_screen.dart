import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:twitter_clone_app/constants/design/colors.dart';
import 'package:twitter_clone_app/constants/design/gaps.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';
import 'package:twitter_clone_app/controller/signup_controller.dart';
import 'package:twitter_clone_app/features/authenfication/customize_screen.dart';
import 'package:twitter_clone_app/features/authenfication/email_code_screen.dart';
import 'package:twitter_clone_app/features/authenfication/widgets/custom_textformfield.dart';
import 'package:twitter_clone_app/features/authenfication/widgets/login_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _birthTextController = TextEditingController();

  final _initDate = DateTime.now();
  final DateFormat formatter = DateFormat('MMMM d, yyyy');

  final _emailPattern = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final _datePattern = RegExp(
    r'^([a-zA-Z]+) (\d{1,2}), (\d{4})$',
  );

  void _goHomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EmailCodeScreen()),
    );
  }

  void _onSubmitTap() {
    if (allValid()) {
      _formKey.currentState!.save();
      SignUpController.auth['name'] = _nameTextController.text;
      SignUpController.auth['email'] = _emailTextController.text;
      SignUpController.auth['birth'] = _birthTextController.text;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CustomizeScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    if (SignUpController.auth.isNotEmpty) {
      _nameTextController.text = SignUpController.auth['name'];
      _emailTextController.text = SignUpController.auth['email'];
      _birthTextController.text = SignUpController.auth['birth'];
    }
  }

  bool allValid() {
    if (_formKey.currentState != null) {
      return _formKey.currentState!.validate();
    }
    return false;
  }

  void setTextFieldDate(DateTime date) {
    final textDate = formatter.format(date);
    _birthTextController.value = TextEditingValue(text: textDate);
    setState(() {});
  }

  String? nameValid(String? value) {
    if (value == null) {
      return 'Please your name';
    } else if (value.isNotEmpty) {
      return null;
    }
    return 'not unique';
  }

  String? emailValid(String? value) {
    if (value == null) {
      return 'Please your email or phone number';
    } else if (_emailPattern.hasMatch(value)) {
      return null;
    }
    return 'Email not valid';
  }

  String? birthValid(String? value) {
    if (value == null) {
      return 'Please your birth';
    } else if (_datePattern.hasMatch(value)) {
      return null;
    }
    return 'birth not valid';
  }

  void unfocusKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: unfocusKeyboard,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(top: Sizes.size16, left: Sizes.size10),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, letterSpacing: -0.4),
                ),
              )),
          title: const FaIcon(
            FontAwesomeIcons.twitter,
            color: MyColors.primary,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create your account',
                    style: TextStyle(
                      fontSize: Sizes.size28 + Sizes.size2,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Gaps.v14,
                  CustomTextFormField(
                    controller: _nameTextController,
                    keyboardType: TextInputType.name,
                    isCheck: nameValid(_nameTextController.text) == null,
                    hintText: 'Name',
                    labelText: 'Name',
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: (value) => nameValid(value),
                    onSaved: (value) => nameValid(value),
                  ),
                  Gaps.v14,
                  CustomTextFormField(
                    controller: _emailTextController,
                    keyboardType: TextInputType.emailAddress,
                    isCheck: emailValid(_emailTextController.text) == null,
                    hintText: 'Phone number or email address',
                    labelText: 'Phone number or Email',
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: (value) => emailValid(value),
                    onSaved: (value) => emailValid(value),
                  ),
                  Gaps.v14,
                  CustomTextFormField(
                    controller: _birthTextController,
                    isCheck: birthValid(_birthTextController.text) == null,
                    hintText: 'Date of birth',
                    labelText: 'Date of birth',
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: (value) => birthValid(value),
                    onSaved: (value) => birthValid(value),
                  ),
                  _birthTextController.text.isNotEmpty &&
                          !SignUpController.isCustomizeCheck
                      ? const Text(
                          'This will not be shown publicy. Confirm your own age, even if this account is for a business, a pet, or something else.')
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          height: 280,
          child: SignUpController.isCustomizeCheck
              ? Column(
                  children: [
                    const Text(
                      '''By Signing up, you agree to the Terms of Service and Privacy Policy, including Cookie Use. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account account secure and personalizing our service, including ads. Learn more. Others will be able to find you by email or phone number, when provided, unless you choose otherwise here.''',
                      style: TextStyle(
                          fontSize: Sizes.size14,
                          color: Colors.black87,
                          height: 1.3),
                    ),
                    Gaps.v20,
                    LoginButton(
                      onTap: _goHomeScreen,
                      text: 'Sign up',
                      bgColor: MyColors.primary,
                      textColor: Colors.white,
                    ),
                    Gaps.v20,
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: _onSubmitTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size16,
                          vertical: Sizes.size8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.size20),
                          color: allValid() ? Colors.black : Colors.black54,
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color:
                                allValid() ? Colors.white : MyColors.lightGrey,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: CupertinoDatePicker(
                          maximumDate: _initDate,
                          initialDateTime: _initDate,
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: setTextFieldDate),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
