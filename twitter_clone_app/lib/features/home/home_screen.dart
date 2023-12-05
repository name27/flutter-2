import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_app/constants/colors.dart';
import 'package:twitter_clone_app/features/home/post_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const FaIcon(
        FontAwesomeIcons.twitter,
        color: MyColors.primary,
      )),
      body: const PostScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //item이 4개 이상일 때
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house), label: ''),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass), label: ''),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.penToSquare), label: ''),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.heart), label: ''),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user), label: ''),
        ],
      ),
    );
  }
}
