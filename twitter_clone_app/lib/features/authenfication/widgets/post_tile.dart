import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_app/constants/colors.dart';
import 'package:twitter_clone_app/constants/gaps.dart';
import 'package:twitter_clone_app/constants/sizes.dart';
import 'package:twitter_clone_app/features/authenfication/widgets/photo_list.dart';

class PostTile extends StatelessWidget {
  const PostTile({
    super.key,
    this.profileUrl,
    this.nickname,
    this.content,
    this.peopleProfileUrl,
    this.commentList,
    this.likes,
    this.photoUrls,
  });
  final String? profileUrl;
  final String? nickname;
  final String? content;
  final List<String>? peopleProfileUrl;
  final List<String>? photoUrls;

  final List<String>? commentList;
  final int? likes;

  @override
  Widget build(BuildContext context) {
    TextPainter nickNamePainter = TextPainter(
      text: TextSpan(text: nickname),
      textDirection: TextDirection.ltr,
    );
    TextPainter textPainter = TextPainter(
      text: TextSpan(text: content),
      textDirection: TextDirection.ltr,
    );
    nickNamePainter.layout();
    textPainter.layout();

    const leftPosition = Sizes.size40 + Sizes.size20;

    return Stack(
      children: [
        const SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: Sizes.size28,
                              ),
                              CircleAvatar(
                                radius: Sizes.size24 + Sizes.size2,
                                backgroundImage: profileUrl != null
                                    ? NetworkImage(profileUrl!)
                                    : null,
                              ),
                              const Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: Sizes.size14,
                                ),
                              ),
                              const Positioned(
                                bottom: 0,
                                right: 0,
                                child: Icon(
                                  Icons.add_circle,
                                  size: Sizes.size28,
                                ),
                              ),
                            ],
                          ),
                          Gaps.v10,
                          Container(
                            width: Sizes.size3,
                            height: 220 + textPainter.height,
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
                            Text(textPainter.plainText),
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
                  const Row(
                    children: [
                      Text('2m'),
                      Gaps.h5,
                      Icon(Icons.more_horiz_outlined)
                    ],
                  ),
                ],
              ),
              Gaps.v10,
              const Row(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: Sizes.size56,
                        height: Sizes.size56,
                      ),
                      Positioned(
                        top: Sizes.size9,
                        left: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: Sizes.size11,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: Sizes.size14,
                          backgroundColor: Colors.blueAccent,
                        ),
                      ),
                      Positioned(
                        left: Sizes.size1,
                        right: Sizes.size1,
                        bottom: Sizes.size3,
                        child: CircleAvatar(
                          backgroundColor: Colors.yellow,
                          radius: Sizes.size10,
                        ),
                      ),
                    ],
                  ),
                  Gaps.h10,
                  Text('36 replies'),
                  Gaps.h10,
                  Icon(
                    Icons.circle,
                    size: Sizes.size5,
                  ),
                  Gaps.h10,
                  Text('27 likes'),
                ],
              ),
            ],
          ),
        ),
        Gaps.h5,
        photoUrls != null
            ? Positioned(
                top: textPainter.height + nickNamePainter.height + Sizes.size32,
                left: Sizes.size10,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: PhotoList(photoUrl: photoUrls!),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
