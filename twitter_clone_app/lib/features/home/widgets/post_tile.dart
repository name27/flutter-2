import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_app/constants/design/colors.dart';
import 'package:twitter_clone_app/constants/design/gaps.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';
import 'package:twitter_clone_app/features/home/widgets/icon_profile_avatar.dart';
import 'package:twitter_clone_app/features/home/widgets/more_bottom_sheet.dart';
import 'package:twitter_clone_app/features/home/widgets/photo_list.dart';
import 'package:twitter_clone_app/features/home/widgets/report_bottom_sheet.dart';

class PostTile extends StatelessWidget {
  const PostTile({
    super.key,
    this.profile,
    this.nickname,
    this.content,
    this.commentList,
    this.likes,
    this.photos,
    this.replies,
    this.time,
    required this.peopleProfiles,
  });
  final String? profile;
  final String? nickname;
  final String? content;
  final List<String> peopleProfiles;
  final List<String>? photos;
  final List<String>? commentList;
  final int? likes;
  final int? replies;
  final String? time;

  @override
  Widget build(BuildContext context) {
    TextPainter nickNamePainter = TextPainter(
      text: TextSpan(text: nickname),
      textDirection: TextDirection.ltr,
    );
    TextPainter contentPainter = TextPainter(
      text: TextSpan(text: content),
      textDirection: TextDirection.ltr,
    );
    nickNamePainter.layout();
    contentPainter.layout();

    const leftPosition = Sizes.size40 + Sizes.size20;

    void reportTap() {
      Navigator.pop(context);
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const ReportBottomSheet();
        },
      );
    }

    void moreTap() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return MoreBottomSheet(
            reportOnTap: reportTap,
          );
        },
      );
    }

    return Stack(
      children: [
        const SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        children: [
                          IconProfileAvatar(
                            profileUrl: profile,
                            icon: const Icon(
                              Icons.add_circle,
                              size: Sizes.size28,
                            ),
                          ),
                          Gaps.v10,
                          Container(
                            width: Sizes.size3,
                            height: (photos == null ? 0 : 200) +
                                Sizes.size16 +
                                contentPainter.height,
                            decoration: const BoxDecoration(
                              color: MyColors.lightGrey,
                            ),
                          ),
                        ],
                      ),
                      Gaps.h10,
                      Positioned(
                        left: leftPosition,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(nickNamePainter.plainText),
                                Gaps.h5,
                                const FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  color: MyColors.primary,
                                  size: Sizes.size16,
                                ),
                              ],
                            ),
                            SizedBox(
                                width: contentPainter.width,
                                child: Text(contentPainter.plainText)),
                          ],
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        left: leftPosition,
                        child: Row(
                          children: [
                            FaIcon(FontAwesomeIcons.heart),
                            Gaps.h20,
                            FaIcon(FontAwesomeIcons.comment),
                            Gaps.h20,
                            FaIcon(
                              FontAwesomeIcons.retweet,
                            ),
                            Gaps.h20,
                            FaIcon(FontAwesomeIcons.paperPlane)
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    right: 0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${time}m'),
                        Gaps.h5,
                        GestureDetector(
                            onTap: moreTap,
                            child: const Icon(Icons.more_horiz_outlined))
                      ],
                    ),
                  ),
                ],
              ),
              Gaps.v10,
              Row(
                children: [
                  Stack(
                    children: [
                      const SizedBox(
                        width: Sizes.size56,
                        height: Sizes.size56,
                      ),
                      Positioned(
                        top: Sizes.size9,
                        left: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: Sizes.size11,
                          backgroundImage: NetworkImage(peopleProfiles[0]),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: Sizes.size14,
                          backgroundImage: NetworkImage(peopleProfiles[1]),
                          backgroundColor: Colors.blueAccent,
                        ),
                      ),
                      Positioned(
                        left: Sizes.size1,
                        right: Sizes.size1,
                        bottom: Sizes.size3,
                        child: CircleAvatar(
                          backgroundColor: Colors.yellow,
                          backgroundImage: NetworkImage(peopleProfiles[2]),
                          radius: Sizes.size10,
                        ),
                      ),
                    ],
                  ),
                  Gaps.h10,
                  Text('$replies replies'),
                  Gaps.h10,
                  const Icon(
                    Icons.circle,
                    size: Sizes.size5,
                  ),
                  Gaps.h10,
                  Text('$likes likes'),
                ],
              ),
            ],
          ),
        ),
        Gaps.h5,
        photos != null
            ? Positioned(
                top: contentPainter.height +
                    nickNamePainter.height +
                    Sizes.size32,
                left: Sizes.size10,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: PhotoList(photoUrl: photos!),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
