import 'package:flutter/material.dart';

import '../func/home.dart';
import '../func/list.dart';
import '../func/profile.dart';
import '3.dart';
import '5.dart';

class Question4 extends StatelessWidget {
  const Question4({super.key});

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
  final List<Widget> _children = [Home(), Listview(), Home(), Profile()];
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
                          icon: Icon(
                              Icons.home_outlined, color: Colors.black),
                          iconSize: 30,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home()),
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
                          'assets/images/bar/bar4.png',
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
                      child: Text('4. 어쩌다 무대에 불려가 서게 된 당신! \n그때의 심정은? ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center
                      ),
                    ),
                    SizedBox(
                      height: 220 * (deviceHeight / standardDeviceHeight),
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
                                    Text('은근 관심 받는거 좋다',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                        textAlign: TextAlign.center),
                                    Text('뭐라도 하고 나옴',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                                onPressed: () {
                                  Profile.d += 10;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Question5()),
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
                                    Text('너무 부끄러운 심정에',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                        textAlign: TextAlign.center),
                                    Text('아무것도 못하고 내려온다',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                                onPressed: () {
                                  Profile.b += 10;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Question5()),
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

    );
  }
}
