import 'package:flutter/material.dart';
import 'package:twitter_clone_app/constants/design/colors.dart';
import 'package:twitter_clone_app/constants/design/gaps.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';
import 'package:twitter_clone_app/features/home/widgets/certificate_mark.dart';
import 'package:twitter_clone_app/features/home/widgets/icon_profile_avatar.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.profileUrl,
    required this.nickname,
    this.followers,
    required this.subtitle,
    this.content,
    this.isFollowing = true,
    this.profileIcon,
    this.badge,
  });
  final String profileUrl;
  final String nickname;
  final String? followers;
  final String subtitle;
  final String? content;
  final bool isFollowing;
  final Widget? profileIcon;
  final Widget? badge;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconProfileAvatar(
          profileUrl: profileUrl,
          icon: profileIcon,
        ),
        Gaps.h10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      nickname,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: Sizes.size14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Gaps.h3,
                  badge ?? const CertificateMark()
                ],
              ),
              Gaps.v1,
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: Sizes.size14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Gaps.v6,
              Text(
                content ?? '${followers}K followers',
                style: const TextStyle(
                  fontSize: Sizes.size14,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Gaps.h6,
        isFollowing
            ? Container(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size4,
                  horizontal: Sizes.size16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.size10),
                  border: Border.all(
                    color: MyColors.lightGrey,
                  ),
                ),
                child: const Text(
                  "Follow",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: Sizes.size14),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
