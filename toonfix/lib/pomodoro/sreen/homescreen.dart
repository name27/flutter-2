import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> selectMinuteList = [2, 20, 25, 30, 35];
  int selectedMinute = 25;
  late int totalSecond;
  late Timer timer;
  bool isRunning = false;
  int round = 0;
  int goal = 0;
  static const maxRound = 2;
  static const maxGoal = 12;

  void formartTotalSecond() {
    totalSecond = selectedMinute;
  }

  String viewTimeFormat() {
    var viewTime = Duration(seconds: totalSecond);
    var formatTime = viewTime.toString().split('.').first.substring(2, 7);
    return formatTime;
  }

  void resetTime(int index) {
    setState(() {
      selectedMinute = selectMinuteList[index];
      formartTotalSecond();
    });
  }

  void onTick(Timer timeer) {
    if (isRunning) {
      if (totalSecond == 0) {
        setState(() {
          isRunning = false;
          timer.cancel();
          if (round == maxRound) {
            round = 0;
            goal++;
            totalSecond = 5 * 60;
          } else {
            round++;
            formartTotalSecond();
          }
        });
      } else {
        setState(() {
          totalSecond -= 1;
        });
      }
    }
  }

  void startOnpress() {
    isRunning = true;
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

  void pauseOnPress() {
    setState(() {
      isRunning = false;
      timer.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    formartTotalSecond();
  }

  @override
  Widget build(BuildContext context) {
    var cardColor = Theme.of(context).cardColor;
    var bgColor = Theme.of(context).colorScheme.background;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 5,
                child: Text(
                  'POMOTIMER',
                  style: TextStyle(
                    color: cardColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            viewTimeFormat().substring(0, 2),
                            style: TextStyle(
                                color: bgColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 52),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ':',
                        style: TextStyle(
                          color: cardColor,
                          fontSize: 50,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            viewTimeFormat().substring(3, 5),
                            style: TextStyle(
                                color: bgColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 52),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: selectMinuteList.length,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              resetTime(index);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: selectedMinute ==
                                                selectMinuteList[index]
                                            ? bgColor
                                            : cardColor),
                                    color: selectedMinute ==
                                            selectMinuteList[index]
                                        ? cardColor
                                        : bgColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0),
                                  child: Center(
                                    child: Text(
                                      '${selectMinuteList[index]}',
                                      style: TextStyle(
                                          color: selectedMinute ==
                                                  selectMinuteList[index]
                                              ? bgColor
                                              : cardColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                    child: IconButton(
                      onPressed: isRunning ? pauseOnPress : startOnpress,
                      icon: Icon(
                        isRunning
                            ? Icons.pause_circle_filled_sharp
                            : Icons.play_circle_fill_sharp,
                        color: cardColor,
                        size: 65,
                      ),
                    ),
                  )),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '$round/$maxRound ',
                          style: TextStyle(
                              color: cardColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Text(
                          'Round',
                          style: TextStyle(
                              color: cardColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '$goal/$maxGoal',
                          style: TextStyle(
                              color: cardColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Text(
                          'Goal',
                          style: TextStyle(
                              color: cardColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
