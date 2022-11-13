import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'main.dart';

bool isTrue = false;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: ((context) => RoPaSc())));
  //   Future.delayed(
  //       Duration(seconds: 3),
  //       () => Navigator.pop(
  //           context, MaterialPageRoute(builder: ((context) => RoPaSc()))));
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  Color bcolor = Colors.black26;
  Color hcolor = Colors.black12;

  @override
  Widget build(BuildContext context) {
    // return (isTrue == true)
    //     ? splash1(context)
    //     : Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => SplashScreen()));

    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: const Color.fromRGBO(207, 223, 255, 1.0),
      appBar: AppBar(
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   systemNavigationBarColor: Color.fromARGB(255, 111, 255, 0),
        //   statusBarColor: Color.fromARGB(255, 207, 223, 255),
        // ),

        elevation: 0,
        backgroundColor: Color.fromARGB(255, 207, 223, 255),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 207, 223, 255),
              Color.fromARGB(255, 136, 174, 251),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Shimmer.fromColors(
                  baseColor: bcolor,
                  highlightColor: hcolor,
                  // direction: ShimmerDirection.,
                  child: Container(
                    height: 45,
                    width: 250,
                    color: Colors.blue,
                  ),
                ),
                Transform.rotate(
                  angle: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(135),
                    child: SizedBox(
                      // color: Colors.red,
                      height: 135,
                      width: 135,
                      child: Shimmer.fromColors(
                        baseColor: Colors.yellow[500]!,
                        highlightColor:
                            const Color.fromARGB(255, 249, 246, 219),
                        // direction: ShimmerDirection.,
                        child: Container(
                          // height: 45,
                          // width: 250,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: bcolor,
                  highlightColor: hcolor,
                  // direction: ShimmerDirection.,
                  child: Container(
                    height: 45,
                    width: 180,
                    color: Colors.blue,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: SizedBox(
                        // color: Colors.red,
                        height: 120,
                        width: 120,
                        child: Shimmer.fromColors(
                          baseColor: Colors.yellow[500]!,
                          highlightColor: Colors.yellow[100]!,
                          // direction: ShimmerDirection.,
                          child: Container(
                            // height: 45,
                            // width: 250,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: SizedBox(
                        // color: Colors.red,
                        height: 120,
                        width: 120,
                        child: Shimmer.fromColors(
                          baseColor: Color.fromARGB(255, 92, 225, 255),
                          highlightColor: Color.fromARGB(255, 209, 247, 255),
                          // direction: ShimmerDirection.,
                          child: Container(
                            // height: 45,
                            // width: 250,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: SizedBox(
                        // color: Colors.red,
                        height: 120,
                        width: 120,
                        child: Shimmer.fromColors(
                          baseColor: Color.fromARGB(255, 252, 92, 255),
                          highlightColor: Color.fromARGB(255, 250, 184, 255),
                          // direction: ShimmerDirection.,
                          child: Container(
                            // height: 45,
                            // width: 250,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Shimmer.fromColors(
                          baseColor: bcolor,
                          highlightColor: hcolor,
                          // direction: ShimmerDirection.,
                          child: Container(
                            height: 33,
                            width: 80,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Shimmer.fromColors(
                          baseColor: bcolor,
                          highlightColor: hcolor,
                          // direction: ShimmerDirection.,
                          child: Container(
                            height: 30,
                            width: 60,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Shimmer.fromColors(
                          baseColor: bcolor,
                          highlightColor: hcolor,
                          // direction: ShimmerDirection.,
                          child: Container(
                            height: 33,
                            width: 80,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Shimmer.fromColors(
                          baseColor: bcolor,
                          highlightColor: hcolor,
                          // direction: ShimmerDirection.,
                          child: Container(
                            height: 30,
                            width: 60,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
