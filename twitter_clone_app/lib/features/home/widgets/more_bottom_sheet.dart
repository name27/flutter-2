import 'package:flutter/material.dart';
import 'package:twitter_clone_app/constants/design/colors.dart';
import 'package:twitter_clone_app/constants/design/gaps.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';

class MoreBottomSheet extends StatelessWidget {
  const MoreBottomSheet({
    super.key,
    this.reportOnTap,
  });
  final void Function()? reportOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.only(top: Sizes.size32, bottom: Sizes.size20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Sizes.size20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width * 0.88,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.size20),
                color: Colors.grey.shade100),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: Sizes.size20,
                    bottom: Sizes.size4,
                  ),
                  child: Text(
                    'Unfollow',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(
                  color: MyColors.lightGrey,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: Sizes.size20,
                    top: Sizes.size4,
                  ),
                  child: Text(
                    'Mute',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gaps.v16,
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width * 0.88,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.size20),
                color: Colors.grey.shade100),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: Sizes.size20,
                    bottom: Sizes.size4,
                  ),
                  child: Text(
                    'Hide',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(
                  color: MyColors.lightGrey,
                ),
                GestureDetector(
                  onTap: reportOnTap,
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: Sizes.size20,
                      top: Sizes.size4,
                    ),
                    child: Text(
                      'Report',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
