import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: Splash(),
    title: "TIC TAC TOE",
    debugShowCheckedModeBanner: false,

  ));
}

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gonext();
  }

  var colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  var colorizeTextStyle = const TextStyle(
      fontSize: 40.0, fontFamily: 'fn1', fontWeight: FontWeight.w500);

  gonext() {
    Future.delayed(Duration(seconds: 7)).then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => First(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xffc0cbd4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Lottie.asset("assets/tic-tac-toe_anim.json"),
              SizedBox(
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'TIC TAC TOE',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                  ],
                  isRepeatingAnimation: true,
                  totalRepeatCount: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  double? height, width, stheight, appheight, bottom, totalheight, imgwidth;
  int o = 0, x = 0, turn = 1, cnt = 0, d = 0;
  List value = List.filled(9, "");
  List oxColor = List.filled(9, Colors.black);
  String win = "";
  Color Oactive = Color(0xff4997C2);
  Color Xactive = Color(0xffc24949);
  Color WinColor = Color(0xff000000);
  Color inactive = Color(0xff6b6b6d);
  bool tap = true;

  var colorizeColors = [
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.lightGreen,
    Colors.cyan,
  ];

  @override
  Widget build(BuildContext context) {
    totalheight = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    stheight = MediaQuery.of(context).padding.top;
    bottom = MediaQuery.of(context).padding.bottom;
    appheight = kToolbarHeight;
    height = totalheight! - stheight! - bottom!;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xffc0cbd4),
          child: Column(
            children: [
              SizedBox(
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'TIC TAC TOE',
                      colors: colorizeColors,
                      speed: Duration(seconds: 3),
                      textStyle:
                          const TextStyle(fontFamily: "fn1", fontSize: 50),
                    ),
                  ],
                  repeatForever: true,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                height: height! * 0.13,
                width: width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "O",
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: "fn2",
                              color: cnt % 2 == 0 ? Oactive : inactive),
                        ),
                        Text(
                          "X",
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: "fn2",
                              color: cnt % 2 == 0 ? inactive : Xactive),
                        ),
                        Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.blueGrey,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "$o Wins",
                          style: TextStyle(
                            fontFamily: "tn2",
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "$x Wins",
                          style: TextStyle(
                            fontFamily: "tn2",
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "$d Draw",
                          style: TextStyle(
                            fontFamily: "tn2",
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: width! * 0.95,
                width: width! * 0.95,
                margin: EdgeInsets.only(top: height! * 0.05),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Customclick(0),
                        Container(
                          width: 8,
                          height: width! * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                        ),
                        Customclick(1),
                        Container(
                          width: 8,
                          height: width! * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                        ),
                        Customclick(2),
                      ],
                    ),
                    Container(
                      width: width! * 0.9,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Customclick(3),
                        Container(
                          width: 8,
                          height: width! * 0.3,
                          color: Colors.black,
                        ),
                        Customclick(4),
                        Container(
                          width: 8,
                          height: width! * 0.3,
                          color: Colors.black,
                        ),
                        Customclick(5),
                      ],
                    ),
                    Container(
                      width: width! * 0.9,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Customclick(6),
                        Container(
                          width: 8,
                          height: width! * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                        ),
                        Customclick(7),
                        Container(
                          width: 8,
                          height: width! * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                        ),
                        Customclick(8),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Column(
                  children: [
                    Container(
                      // height: height! * 0.05,
                      padding: EdgeInsets.only(top: 10, bottom: 15),
                      alignment: Alignment.center,
                      child: Text(
                        win,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: WinColor),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 25,
                      foregroundColor: Colors.greenAccent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            resetgame();
                            Fluttertoast.showToast(
                                msg: "Rematch",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Color(0x43ffffff),
                                textColor: Oactive,
                                fontSize: 16.0
                            );
                          });
                        },
                        onLongPress: () {
                          setState(() {
                            Fluttertoast.showToast(
                                msg: "Game Reset",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Color(0x43ffffff),
                                textColor: Xactive,
                                fontSize: 16.0
                            );
                            o = 0;
                            x = 0;
                            d = 0;
                            HapticFeedback.vibrate();
                          });
                        },
                        child: Icon(
                          Icons.autorenew_rounded,
                          size: 40,
                        ),
                        radius: 40,
                        splashColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  winner() {
    if ((value[0] == "O" && value[1] == "O" && value[2] == "O") ||
        (value[3] == "O" && value[4] == "O" && value[5] == "O") ||
        (value[6] == "O" && value[7] == "O" && value[8] == "O") ||
        (value[0] == "O" && value[3] == "O" && value[6] == "O") ||
        (value[1] == "O" && value[4] == "O" && value[7] == "O") ||
        (value[2] == "O" && value[5] == "O" && value[8] == "O") ||
        (value[0] == "O" && value[4] == "O" && value[8] == "O") ||
        (value[2] == "O" && value[4] == "O" && value[6] == "O")) {
      win = "Player O is Winner";
      o++;
      tap = false;
      WinColor = Oactive;
      Future.delayed(Duration(seconds: 1)).then((value) {
        resetgame();
      });
    } else if ((value[0] == "X" && value[1] == "X" && value[2] == "X") ||
        (value[3] == "X" && value[4] == "X" && value[5] == "X") ||
        (value[6] == "X" && value[7] == "X" && value[8] == "X") ||
        (value[0] == "X" && value[3] == "X" && value[6] == "X") ||
        (value[1] == "X" && value[4] == "X" && value[7] == "X") ||
        (value[2] == "X" && value[5] == "X" && value[8] == "X") ||
        (value[0] == "X" && value[4] == "X" && value[8] == "X") ||
        (value[2] == "X" && value[4] == "X" && value[6] == "X")) {
      win = "Player X is Winner";
      x++;
      tap = false;
      WinColor = Xactive;
      Future.delayed(Duration(seconds: 1)).then((value) {
        resetgame();
      });
    } else if (value[0] != "" &&
        value[1] != "" &&
        value[2] != "" &&
        value[3] != "" &&
        value[4] != "" &&
        value[5] != "" &&
        value[6] != "" &&
        value[7] != "" &&
        value[8] != "") {
      win = "Match Tie";
      WinColor = Colors.blueGrey;
      d++;
      Future.delayed(Duration(seconds: 1)).then((value) {
        resetgame();
      });
    }
  }

  resetgame() {
    setState(() {
      value = List.filled(9, "");
      win = "";
      turn = 1;
      tap = true;
      cnt = 0;
    });
  }

  Customclick(int val) {
    return InkWell(
      onTap: tap
          ? () {
              setState(() {
                if (value[val] == "") {
                  if (cnt % 2 == 0) {
                    value[val] = "O";
                    turn = 2;
                    oxColor[val] = Oactive;
                  } else {
                    value[val] = "X";
                    turn = 1;
                    oxColor[val] = Xactive;
                  }
                  cnt++;
                  winner();
                }
              });
            }
          : null,
      child: Container(
        height: (width! - 20) * 0.3,
        width: (width! - 20) * 0.3,
        alignment: Alignment.center,
        child: Text(
          value[val],
          style:
              TextStyle(fontSize: 70, fontFamily: "fn2", color: oxColor[val]),
        ),
      ),
      splashColor: oxColor[val],
    );
  }
}
