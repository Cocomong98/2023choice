import 'dart:math';

import 'package:choice/func/like.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'list.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  static int m = 0;
  static int w = 0;
  static int h = 0;
  static int y = 0;
  static int d = 0;
  static int b = 0;

  static List<dynamic> nlist = [0,0,0,0]; // MYD, MHD 일 시 사용

  static int body = 0; // MYB, MHB - 도구X 일 시 사용
  static int tool = 0; // MYB, MHB - 도구O 일 시 사용

  static int com = 0; // WYB-전산 일 시 사용
  static int study = 0; // WYB-전산 외 일 시 사용

  static int volunteer = 0; //WYB-봉사 일 시 사용

  static String mw = '';
  static String hy = '';
  static String db = '';

  static String getResult() {
    if(m>w) mw = 'M';
    else mw = 'W';
    if(h>y) hy = 'H';
    else hy = 'Y';
    if(d>b) db = 'D';
    else db = 'B';

    String result = mw+hy+db;

    if(result == 'MYD' || result == 'MHD') {
      int max = nlist[0];
      for (var element in nlist) {
        if (element > max) {
          max = element;
        }
      }
      int maxindex = nlist.indexOf(max);
      print(maxindex);
      if(maxindex==0) result += '-춤';
      else if(maxindex==1) result += '-노래,랩';
      else if(maxindex==2) result += '-악기';
      else result += '-밴드';
    }

    if(result == 'MYB' || result == 'MHB') {
      if(body>tool) result += '-도구X';
      else result += '-도구O';
    }

    if(result == 'WYB') {
      if(volunteer != 0) result += '-봉사';
      else {
        if(com>study) result += '-전산';
        else result += '-전산 외';
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int current_index = 3;
  final List<Widget> _children = [Home(), Listview(), Like(), Profile()];
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void showPopup(context, title, image, description, detail, String desc1, String desc2, String desc3) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 1.0,
            height: 220,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                    style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Column(
              children: [
                const SizedBox(
                    height: 30
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    detail,
                    maxLines: 3,
                    style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      Column(
                        children: [
                          Text(
                            desc1,
                            style: const TextStyle(
                                fontSize: 15,
                                //fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            desc2,
                            style: const TextStyle(
                                fontSize: 15,
                                //fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            desc3,
                            style: const TextStyle(
                                fontSize: 15,
                                //fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    bool selected = false;
    Icon first_icon = Icon(Icons.favorite_border);
    Icon second_icon = Icon(Icons.favorite);

    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 900;

    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 410;

    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      body:StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Color(0xffB9CAFE),
                toolbarHeight: 100,
                title: Text('PROFILE!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(100),
                  ),
                ),
              ),
              body: Scrollbar(
                controller: _scrollController,
                isAlwaysShown: true,
                thickness: 10,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                        height: 20 * (deviceHeight / standardDeviceHeight)),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
                        color: Colors.white,
                        child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('개인프로필',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.person,
                                      size: 150,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${snapshot.data?.displayName}',
                                          style: TextStyle(
                                            height: 1,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10 * ( deviceHeight / standardDeviceHeight),
                                        ),
                                        Text('${snapshot.data?.email}',
                                          style: TextStyle(
                                            height: 1,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30 * ( deviceHeight / standardDeviceHeight),
                                ),
                                Text('최근 테스트 결과',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
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
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}

