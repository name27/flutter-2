import 'package:flutter/material.dart';
import 'package:twitter_clone_app/constants/dummy_data.dart';
import 'package:twitter_clone_app/constants/design/gaps.dart';
import 'package:twitter_clone_app/features/home/widgets/post_tile.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemCount: DummyData.sampleData.length,
      itemBuilder: (context, index) => PostTile(
        profile: DummyData.sampleData[index]['profile'],
        nickname: DummyData.sampleData[index]['nickname'],
        content: DummyData.sampleData[index]['content'],
        photos: DummyData.sampleData[index]['photos'],
        likes: DummyData.sampleData[index]['likes'],
        replies: DummyData.sampleData[index]['replies'],
        time: DummyData.sampleData[index]['time'].toString(),
        peopleProfiles: DummyData.sampleData[index]['peopleProfiles'],
      ),
      separatorBuilder: (context, index) => Gaps.v10,
    );
  }
}
