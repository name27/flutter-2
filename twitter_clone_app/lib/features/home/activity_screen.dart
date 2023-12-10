import 'package:flutter/material.dart';
import 'package:twitter_clone_app/constants/design/gaps.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';
import 'package:twitter_clone_app/constants/dummy_data.dart';
import 'package:twitter_clone_app/features/home/widgets/profile_list_tile.dart';

final List tabMenu = ["All", "Replies", "Mention", "Follwers", "Likes"];

class ActivitySCreen extends StatefulWidget {
  const ActivitySCreen({super.key});

  @override
  State<ActivitySCreen> createState() => _ActivitySCreenState();
}

class _ActivitySCreenState extends State<ActivitySCreen> {
  int tabIndex = 0;

  void _unfocusKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  void _tabOntTap(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabMenu.length,
      child: GestureDetector(
        onTap: () => _unfocusKeyboard(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v8,
              const Text(
                'Activity',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: Sizes.size36,
                ),
              ),
              Gaps.v8,
              TabBar(
                splashFactory: NoSplash.splashFactory,
                isScrollable: true,
                labelColor: Colors.black,
                indicatorColor: Colors.transparent,
                onTap: (index) => (_tabOntTap(index)),
                tabAlignment: TabAlignment.start,
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: Sizes.size4),
                tabs: [
                  for (var menu in tabMenu)
                    Tab(
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Sizes.size10),
                            border: Border.all(color: Colors.black26),
                            color: tabMenu[tabIndex] == menu
                                ? Colors.black
                                : Colors.white),
                        child: Center(
                          child: Text(
                            menu,
                            style: TextStyle(
                                fontSize: Sizes.size20,
                                color: tabMenu[tabIndex] == menu
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Gaps.v20,
              Expanded(
                child: TabBarView(children: [
                  for (var menu in tabMenu)
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: DummyData.sampleData.length,
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey.shade200,
                      ),
                      itemBuilder: (context, index) => ProfileListTile(
                        isFollowing:
                            DummyData.sampleData[index]['bool'] ?? false,
                        badge: Text(
                          '${DummyData.sampleData[index]["time"]}h',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: Sizes.size14,
                          ),
                        ),
                        content: DummyData.sampleData[index]['content'],
                        profileIcon: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: DummyData.sampleData[index]
                                  ['color'],
                              radius: Sizes.size12 + Sizes.size1,
                            ),
                            Positioned(
                              child: DummyData.sampleData[index]["icon"] ??
                                  const SizedBox(),
                            )
                          ],
                        ),
                        profileUrl: DummyData.sampleData[index]["profile"],
                        nickname: DummyData.sampleData[index]['nickname'],
                        subtitle: DummyData.sampleData[index]['content'],
                        followers:
                            DummyData.sampleData[index]['followers'].toString(),
                      ),
                    ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
