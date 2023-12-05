import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_app/constants/colors.dart';
import 'package:twitter_clone_app/constants/gaps.dart';
import 'package:twitter_clone_app/constants/photos.dart';
import 'package:twitter_clone_app/constants/sizes.dart';
import 'package:twitter_clone_app/features/authenfication/widgets/photo_list.dart';
import 'package:twitter_clone_app/features/authenfication/widgets/post_tile.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> likes = [210, 12, 636];
    List<String> nicknames = ['aaaa', 'bbbb', 'cccc'];
    List<String> contents = [
      'aasdnjalsjdaaa',
      'basdnaslndaksbbb',
      'ccasdknalskndlascc'
    ];
    List<List<String>> photos = [
      Photos.photoUrl,
      Photos.photoUrl2,
      Photos.photoUrl3
    ];

    return ListView.separated(
      itemCount: 3,
      itemBuilder: (context, index) => PostTile(
        profileUrl: Photos.profileUrl[index],
        nickname: nicknames[index],
        content: contents[index],
        photoUrls: photos[index],
        likes: likes[index],
      ),
      separatorBuilder: (context, index) => Gaps.v10,
    );
  }
}
