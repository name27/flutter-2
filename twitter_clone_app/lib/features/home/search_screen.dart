import 'package:flutter/material.dart';
import 'package:twitter_clone_app/constants/design/gaps.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';
import 'package:twitter_clone_app/constants/dummy_data.dart';
import 'package:twitter_clone_app/features/home/widgets/grey_text_field.dart';
import 'package:twitter_clone_app/features/home/widgets/profile_list_tile.dart';

class SearchSCreen extends StatefulWidget {
  const SearchSCreen({super.key});

  @override
  State<SearchSCreen> createState() => _SearchSCreenState();
}

class _SearchSCreenState extends State<SearchSCreen> {
  final TextEditingController _searchTextController = TextEditingController();
  void _unfocusKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _unfocusKeyboard(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v8,
            const Text(
              'Search',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: Sizes.size36,
              ),
            ),
            Gaps.v8,
            GreyTextField(
              controller: _searchTextController,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Gaps.v20,
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: DummyData.sampleData.length,
                  separatorBuilder: (context, index) => Gaps.v14,
                  itemBuilder: (context, index) => DummyData.sampleData[index]
                              ["nickname"]
                          .contains(_searchTextController.text)
                      ? ProfileListTile(
                          profileUrl: DummyData.sampleData[index]["profile"],
                          nickname: DummyData.sampleData[index]['nickname'],
                          subtitle: DummyData.sampleData[index]['nickname']
                              .toUpperCase(),
                          followers: DummyData.sampleData[index]['followers']
                              .toString(),
                        )
                      : const SizedBox()),
            ),
          ],
        ),
      ),
    );
  }
}
