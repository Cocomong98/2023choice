import 'package:flutter/material.dart';

import '../func/home.dart';
import '../func/list.dart';
import '4.dart';
import '6.dart';
import '7.dart';
import '9.dart';

class Question8 extends StatelessWidget {
  const Question8({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int current_index = 0;
  final List<Widget> _children = [Home(), Listview(), Home(), Home()];
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 900;
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 410;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 30
                          ),
                          icon: Image.asset('assets/images/left.png'),
                          iconSize: 30,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Question7()),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40 * ( deviceHeight / standardDeviceHeight),
                    ),
                    Container(
                      color: Colors.white,
                      child: Center(
                        child: Image.asset(
                          'assets/images/bar/bar8.png',
                          height: 50 * ( deviceWidth / standardDeviceWidth),
                          width: 350 * ( deviceWidth / standardDeviceWidth),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40 * ( deviceHeight / standardDeviceHeight),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 120 * ( deviceHeight / standardDeviceHeight),
                      child: Text('8. 너무 완벽한 무대를 접한 당신\n 당신의 속마음은?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center
                      ),
                    ),
                    SizedBox(
                      height: 220 * ( deviceHeight / standardDeviceHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    primary: Color(0xffB9CAFE),
                                    minimumSize: Size(380, 90),
                                    alignment: Alignment.center,
                                    textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                                ),
                                child: Column(
                                  children: [
                                    Text('오 나도 한번 저런 무대 서보고 싶다 ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Question9()),
                                  );
                                },
                              )
                          ),
                          InkWell(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    primary: Color(0xffFF9281),
                                    minimumSize: Size(380, 90),
                                    alignment: Alignment.center,
                                    textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                                ),
                                child: Column(
                                  children: [
                                    Text('오 잘한다.. (끝) ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Question9()),
                                  );
                                },
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: current_index,
        backgroundColor: Colors.black,
        onTap: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => _children[index]),
          );
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '리스트',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '찜',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '프로필',
            backgroundColor: Colors.black,
          ),
        ],
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
