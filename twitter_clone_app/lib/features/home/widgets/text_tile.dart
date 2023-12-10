import 'package:flutter/material.dart';
import 'package:twitter_clone_app/constants/design/colors.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';

class TextTile extends StatelessWidget {
  const TextTile({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Divider(
          color: MyColors.lightGrey,
        ),
        ListTile(
          minVerticalPadding: 0,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          title: Text(text),
          trailing: const Icon(Icons.navigate_next),
        ),
        // Row(
        //   children: [
        //     Gaps.h20,
        //     SizedBox(
        //       width: MediaQuery.of(context).size.width * 0.8,
        //       child: Text(
        //         text,
        //         maxLines: 1,
        //         overflow: TextOverflow.ellipsis,
        //         style: const TextStyle(
        //           fontWeight: FontWeight.w500,
        //           fontSize: Sizes.size16,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
