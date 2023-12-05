import 'package:flutter/material.dart';
import 'package:toonfix/toonfix/widget/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: const TextTheme()),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: Image.network('https://picsum.photos/50/50'),
                      ),
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'MONDAY 16',
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    children: [
                      const Text(
                        'TODAY',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 36),
                      ),
                      const Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 52,
                        width: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '${17 + index}',
                              style: const TextStyle(
                                  color: Colors.white60, fontSize: 36),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  MyCard(
                    startHour: '11',
                    startMinute: '30',
                    endHour: '12',
                    endMinute: '20',
                    title: 'DESIGN',
                    subTitle: 'MEETING',
                    people: const ['ALEX', 'HELENA', 'NANA'],
                    bgolor: Colors.yellow.shade300,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MyCard(
                    startHour: '12',
                    startMinute: '35',
                    endHour: '14',
                    endMinute: '10',
                    title: 'DAILY',
                    subTitle: 'PROJECT',
                    people: const [
                      'ME',
                      'RICHARD',
                      'CIRY',
                      'CLOVER',
                      'ANNA',
                      'MARY',
                      'TOMA'
                    ],
                    bgolor: Colors.deepPurple.shade300,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MyCard(
                      startHour: '15',
                      startMinute: '00',
                      endHour: '16',
                      endMinute: '30',
                      title: 'WEEKLY',
                      subTitle: 'PLANNING',
                      people: const ['DEN', 'NANA', 'MARK'],
                      bgolor: Colors.green.shade400)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
