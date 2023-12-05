import 'package:flutter/material.dart';
import 'package:twitter_clone_app/constants/colors.dart';
import 'package:twitter_clone_app/constants/sizes.dart';

class OneTextfield extends StatelessWidget {
  const OneTextfield({
    super.key,
    required this.controller,
    this.onChanged,
    this.focusNode,
  });
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        controller: controller,
        maxLength: 1,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        onChanged: onChanged,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: Sizes.size28),
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          counterText: '',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.lightGrey,
              width: Sizes.size2,
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.lightGrey,
              width: Sizes.size2,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.lightGrey,
              width: Sizes.size2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: Sizes.size2,
            ),
          ),
        ),
      ),
    );
  }
}
