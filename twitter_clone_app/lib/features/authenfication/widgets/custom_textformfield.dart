import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_app/constants/colors.dart';
import 'package:twitter_clone_app/constants/sizes.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.validator,
    required this.isCheck,
    required this.hintText,
    required this.labelText,
    this.keyboardType,
    required this.controller,
    this.enabled,
    this.onSaved,
    this.style,
    this.obscureText,
    this.trailingSuffix,
  });
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isCheck;
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool? enabled;
  final void Function(String?)? onSaved;
  final TextStyle? style;
  final bool? obscureText;
  final Widget? trailingSuffix;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      style: const TextStyle(
        color: MyColors.primary,
      ),
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: MyColors.lightGrey),
        hintText: widget.hintText,
        suffix: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.isCheck
                ? const FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    color: Colors.green,
                  )
                : const SizedBox(),
            widget.trailingSuffix ?? const SizedBox()
          ],
        ),
        label: widget.controller.text.isNotEmpty
            ? Text(
                widget.labelText,
                style: const TextStyle(
                    fontSize: Sizes.size20, color: Colors.black),
              )
            : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.lightGrey),
        ),
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.lightGrey),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.lightGrey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.lightGrey),
        ),
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
    );
  }
}
