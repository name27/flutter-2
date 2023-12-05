import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard(
      {super.key,
      required this.startHour,
      required this.startMinute,
      required this.endHour,
      required this.endMinute,
      required this.title,
      required this.subTitle,
      required this.people,
      required this.bgolor});
  final String startHour, startMinute, endHour, endMinute;
  final String title, subTitle;
  final List<String> people;
  final Color bgolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: bgolor, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
        child: Row(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  startHour,
                  style: const TextStyle(
                      fontSize: 24, height: 0.6, fontWeight: FontWeight.bold),
                ),
                Text(
                  startMinute,
                  style: const TextStyle(fontSize: 16),
                ),
                const Text(
                  '|',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  endHour,
                  style: const TextStyle(
                      fontSize: 24, height: 0.6, fontWeight: FontWeight.bold),
                ),
                Text(
                  endMinute,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 46, height: 0.4),
                    ),
                    Text(
                      subTitle,
                      style: const TextStyle(
                        fontSize: 46,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                SizedBox(
                  height: 20,
                  width: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: people.length,
                    itemBuilder: (context, index) => index > 3
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Text(
                              index == 3
                                  ? '+${people.length - 3}'
                                  : people[index],
                              style: TextStyle(
                                color: people[index] == 'ME'
                                    ? Colors.black
                                    : Colors.black38,
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
