// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './splash.dart';
import './model/dict.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color.fromARGB(255, 101, 152, 255),
    statusBarColor: Color.fromARGB(255, 207, 223, 255),
  ));
  runApp(RoPaSc());
}

class RoPaSc extends StatefulWidget {
  @override
  State<RoPaSc> createState() => _RoPaScState();
}

class _RoPaScState extends State<RoPaSc> {
  // const RoPaSc({Key? key}) : super(key: key);
  // @override
  // void initState() {
  //   super.initState();
  //   print("object");
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: ((context) => SplashScreen())));
  //   Future.delayed(
  //       Duration(seconds: 3),
  //       () => Navigator.pop(context,
  //           MaterialPageRoute(builder: ((context) => SplashScreen()))));
  // }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // color: Colors.green,
      title: "Rock Paper Scisssors",
      home: SplashScreen(),
      // Scaffold(
      //   extendBodyBehindAppBar: true,
      //   backgroundColor: const Color.fromRGBO(207, 223, 255, 1.0),
      //   appBar: AppBar(
      //     // systemOverlayStyle: SystemUiOverlayStyle(
      //     //   systemNavigationBarColor: Color.fromARGB(255, 111, 255, 0),
      //     //   statusBarColor: Color.fromARGB(255, 207, 223, 255),
      //     // ),
      //     actions: [
      //       IconButton(
      //         tooltip: "Change match count",
      //         color: Colors.black,
      //         icon: const Icon(Icons.edit),
      //         onPressed: () {},
      //       ),
      //     ],
      //     elevation: 0,
      //     backgroundColor: Colors.transparent,
      //   ),
      //   // backgroundColor: const Color.fromRGBO(207, 223, 256, 1.0),
      //   body: SafeArea(child: SplashScreen()),
      // ),
    );
  }
}

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);

  // var sz = 35.0;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool disable = false;

  var texts = const TextStyle(
    fontFamily: 'TT',
    fontSize: 35,
  );
  var you = 0;
  var cmp = 0;
  var match = 0;
  String stat = "Start";
  bool restart = false;
  bool disapp = false;

  String? ind = imgindex[(Random().nextInt(3)) + 1];
  void trigger() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        disable = false;
      });
    });
  }

  final player = AudioCache();

  void change(int img) {
    int rd = (Random().nextInt(3)) + 1;
    setState(() {
      ind = imgindex[rd];
      if (img == 1 && rd == 2 || img == 2 && rd == 3 || img == 3 && rd == 1) {
        cmp += 1;
        stat = "You lose";
        match == 9 ? null : player.play('Buzzer Sound Effect.mp3');
      } else if (img == rd) {
        stat = "Draw";
        match == 9 ? null : player.play('Noice.mp3');
      } else {
        stat = "You win";
        you += 1;
        match == 9 ? null : player.play('Ting sound effect.mp3');
      }
      match++;
      if (match == 10) {
        stat = "Play again";
        restart = true;
        disapp = true;
      }
    });
    if (match == 10) {
      setState(() {
        // match = 0;
        stat = "Play Again";
        // you = 0;
        // cmp = 0;
      });
      return;
    }
  }

  void reset() {
    setState(() {
      match = 0;
      you = 0;
      cmp = 0;
      restart = false;
      stat = "Start";
    });
  }

  Widget result() {
    if (you > cmp) {
      return Text(
        "Yeah! You Win",
        style: texts,
      );
    } else if (you < cmp) {
      return Text(
        "Booooo! You Lose",
        style: texts,
      );
    }
    return Text(
      "It's a Draw",
      style: texts,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(207, 223, 255, 1.0),
      appBar: AppBar(
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   systemNavigationBarColor: Color.fromARGB(255, 111, 255, 0),
        //   statusBarColor: Color.fromARGB(255, 207, 223, 255),
        // ),
        actions: [
          IconButton(
            tooltip: "Change match count",
            color: Colors.black,
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 207, 223, 255),
              Color.fromARGB(255, 136, 174, 251),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Stack(
            children: [
              restart && (you > cmp)
                  ? Center(
                      child: Lottie.asset(
                          height: double.infinity,
                          // fit: BoxFit.cover,
                          "assets/62717-confetti.json",
                          animate: true),
                    )
                  : SizedBox(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Matches: $match/10",
                    style: texts,
                  ),
                  Transform.rotate(
                    angle: pi,
                    child: SizedBox(
                      // color: Colors.red,
                      height: 135,
                      width: 135,
                      child: Image(image: AssetImage("$ind")),
                    ),
                  ),
                  restart
                      ? IconButton(
                          onPressed: reset,
                          icon: const Icon(Icons.restart_alt),
                          iconSize: 45,
                          padding: const EdgeInsets.all(0),
                        )
                      : Text(
                          stat,
                          style: texts,
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      disable || restart
                          ? const Image(
                              image: AssetImage("images/Rock_black.png"),
                              height: 120,
                              width: 120,
                            )
                          : MaterialButton(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              minWidth: 0,
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                trigger();
                                change(1);
                                setState(() {
                                  disable = true;
                                });
                              },
                              child: const Image(
                                image: AssetImage("images/Rock.png"),
                                height: 120,
                                width: 120,
                              ),
                            ),
                      disable || restart
                          ? const Image(
                              image: AssetImage("images/Paper_black.png"),
                              height: 120,
                              width: 120,
                            )
                          : MaterialButton(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              minWidth: 0,
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                trigger();
                                change(2);
                                setState(() {
                                  disable = true;
                                });
                              },
                              child: const Image(
                                image: AssetImage("images/Paper.png"),
                                height: 120,
                                width: 120,
                              ),
                            ),
                      disable || restart
                          ? const Image(
                              image: AssetImage("images/Scissor_black.png"),
                              height: 120,
                              width: 120,
                            )
                          : MaterialButton(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              minWidth: 0,
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                trigger();
                                change(3);
                                setState(() {
                                  disable = true;
                                });
                              },
                              child: const Image(
                                image: AssetImage("images/Scissor.png"),
                                height: 120,
                                width: 120,
                              ),
                            ),
                    ],
                  ),
                  restart
                      ? result()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "You",
                                  style: texts,
                                ),
                                Text(
                                  you.toString(),
                                  style: texts,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "CPU",
                                  style: texts,
                                ),
                                Text(
                                  cmp.toString(),
                                  style: texts,
                                ),
                              ],
                            )
                          ],
                        )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

splash1(BuildContext ctx) {
  Navigator.push(
      ctx, MaterialPageRoute(builder: ((context) => SplashScreen())));
  Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pop(
          ctx, MaterialPageRoute(builder: ((context) => SplashScreen()))));
}
