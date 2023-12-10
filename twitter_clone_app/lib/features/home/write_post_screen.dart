import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_app/constants/design/colors.dart';
import 'package:twitter_clone_app/constants/design/gaps.dart';
import 'package:twitter_clone_app/constants/photos.dart';
import 'package:twitter_clone_app/constants/design/sizes.dart';

class WritePostScreen extends StatefulWidget {
  const WritePostScreen({super.key});

  @override
  State<WritePostScreen> createState() => _WritePostScreenState();
}

class _WritePostScreenState extends State<WritePostScreen> {
  TextEditingController postTextController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  void _unfocusKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    TextPainter postPainter = TextPainter(
      text: TextSpan(text: postTextController.text),
      textDirection: TextDirection.ltr,
    );
    postPainter.layout();

    late double textfieldHeignt = focusNode.hasFocus
        ? postPainter.height < size.height * 0.2
            ? postPainter.height
            : size.height * 0.2
        : (postPainter.height < size.height * 0.2
            ? postPainter.height
            : size.height * 0.54);

    return GestureDetector(
      onTap: _unfocusKeyboard,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: const Color.fromARGB(8, 0, 0, 0),
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: const Color.fromARGB(8, 0, 0, 0),
        ),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Container(
                width: size.width * 0.96,
                height: size.height * 0.93,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Sizes.size20),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              width: size.width,
              child: Container(
                height: size.height * 0.94,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Sizes.size20),
                      topRight: Radius.circular(Sizes.size20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                      )
                    ]),
                child: Scaffold(
                  body: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        children: [
                          Gaps.v20,
                          SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.size20),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  const Center(
                                    child: Text(
                                      'New thread',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Sizes.size16 + Sizes.size2,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                          fontSize: Sizes.size16 + Sizes.size2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: CustomScrollView(
                              slivers: [
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                              Sizes.size20),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Gaps.v10,
                                            const Divider(
                                              color: MyColors.lightGrey,
                                            ),
                                            Gaps.v10,
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: Sizes.size20),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: Sizes.size20,
                                                        backgroundImage:
                                                            NetworkImage(
                                                          Photos
                                                              .profileUrl.last,
                                                        ),
                                                      ),
                                                      Gaps.v10,
                                                      Container(
                                                        width: Sizes.size3,
                                                        height: Sizes.size20 +
                                                            textfieldHeignt,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: MyColors
                                                              .lightGrey,
                                                        ),
                                                      ),
                                                      Gaps.v10,
                                                      CircleAvatar(
                                                        radius: Sizes.size10,
                                                        backgroundImage:
                                                            NetworkImage(
                                                          Photos
                                                              .profileUrl.last,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Gaps.h10,
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'clover',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: size.width * 0.7,
                                                        height: 30 +
                                                            textfieldHeignt,
                                                        child: TextField(
                                                          focusNode: focusNode,
                                                          keyboardType:
                                                              TextInputType
                                                                  .multiline,
                                                          maxLines: null,
                                                          expands: true,
                                                          onChanged: (value) {
                                                            setState(() {});
                                                          },
                                                          controller:
                                                              postTextController,
                                                          decoration:
                                                              const InputDecoration(
                                                                  hintText:
                                                                      'Start a thread...'),
                                                        ),
                                                      ),
                                                      Gaps.v10,
                                                      const FaIcon(
                                                        FontAwesomeIcons.link,
                                                        size: Sizes.size16,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    childCount: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        width: size.width,
                        child: BottomAppBar(
                          elevation: 0,
                          height: Sizes.size44,
                          notchMargin: 0,
                          padding: EdgeInsets.zero,
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size20,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Anyone ac reply',
                                  style: TextStyle(
                                    color: MyColors.lightGrey,
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                                Text(
                                  'Post',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: postTextController.text.isEmpty
                                        ? Colors.blue.shade200
                                        : MyColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
