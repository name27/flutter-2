import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_app/constants/design/colors.dart';
import 'package:twitter_clone_app/controller/home_screen_controller.dart';
import 'package:twitter_clone_app/features/home/activity_screen.dart';
import 'package:twitter_clone_app/features/home/post_screen.dart';
import 'package:twitter_clone_app/features/home/search_screen.dart';
import 'package:twitter_clone_app/features/home/widgets/nav_tab.dart';
import 'package:twitter_clone_app/features/home/write_post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isShowAppBar = true;
  late final double realAppBarHeight =
      MediaQuery.of(context).size.height * 0.08;
  late double appBarHeight = MediaQuery.of(context).size.height * 0.08;

  void _onTapIndex(int index) {
    setState(() {
      HomeScreenController.currentIndex = index;
    });
  }

  void _onWritePostOnTap(int index) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const WritePostScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
        fullscreenDialog: true,
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.offset < 100) {
      if (_scrollController.offset <= 10) {
        setState(() {
          appBarHeight = realAppBarHeight;
        });
        return;
      }
      if (_isShowAppBar && appBarHeight > realAppBarHeight) return;
      setState(() {
        if (appBarHeight < realAppBarHeight) {
          appBarHeight += 2.5;
        } else {
          appBarHeight = realAppBarHeight;
        }
        _isShowAppBar = true;
      });
    } else {
      if (!_isShowAppBar && appBarHeight <= 0) return;
      setState(() {
        if (appBarHeight > 0) appBarHeight -= 2.5;
        _isShowAppBar = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenController.currentIndex == 0
          ? AppBar(
              toolbarHeight: appBarHeight,
              title: const FaIcon(
                FontAwesomeIcons.twitter,
                color: MyColors.primary,
              ),
            )
          : null,
      body: SafeArea(
        child: Stack(
          children: [
            Offstage(
              offstage: HomeScreenController.currentIndex != 0,
              child: PostScreen(
                scrollController: _scrollController,
              ),
            ),
            Offstage(
              offstage: HomeScreenController.currentIndex != 1,
              child: const SearchSCreen(),
            ),
            Offstage(
              offstage: HomeScreenController.currentIndex != 3,
              child: const ActivitySCreen(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
                isSelected: HomeScreenController.currentIndex == 0,
                icon: FontAwesomeIcons.house,
                onTap: () => _onTapIndex(0)),
            NavTab(
                isSelected: HomeScreenController.currentIndex == 1,
                icon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => _onTapIndex(1)),
            NavTab(
                isSelected: HomeScreenController.currentIndex == 2,
                icon: FontAwesomeIcons.solidPenToSquare,
                selectedIcon: FontAwesomeIcons.penToSquare,
                onTap: () => _onWritePostOnTap(2)),
            NavTab(
                isSelected: HomeScreenController.currentIndex == 3,
                icon: FontAwesomeIcons.solidHeart,
                selectedIcon: FontAwesomeIcons.heart,
                onTap: () => _onTapIndex(3)),
            NavTab(
                isSelected: HomeScreenController.currentIndex == 4,
                icon: FontAwesomeIcons.solidUser,
                selectedIcon: FontAwesomeIcons.user,
                onTap: () => _onTapIndex(4)),
          ],
        ),
      ),
    );
  }
}
