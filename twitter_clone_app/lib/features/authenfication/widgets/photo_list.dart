import 'package:flutter/material.dart';
import 'package:twitter_clone_app/constants/photos.dart';
import 'package:twitter_clone_app/constants/sizes.dart';

class PhotoList extends StatelessWidget {
  const PhotoList({
    super.key,
    required this.photoUrl,
  });
  final List<String> photoUrl;
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 0.8);
    return PageView.builder(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      itemCount: 2,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size5),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(Sizes.size20),
          ),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.network(
              photoUrl[index],
            ),
          ),
        ),
      ),
    );
  }
}
