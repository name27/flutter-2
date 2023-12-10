import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';

class GreyTextField extends StatelessWidget {
  const GreyTextField({
    super.key,
    required this.controller,
    this.onChanged,
  });
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 0,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size12,
              top: Sizes.size12,
              bottom: Sizes.size12,
            ),
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.grey.shade500,
              size: Sizes.size20,
            ),
          ),
          hintText: "Search",
          hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: Sizes.size16 + Sizes.size2),
          fillColor: Colors.grey.shade200,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Sizes.size10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
