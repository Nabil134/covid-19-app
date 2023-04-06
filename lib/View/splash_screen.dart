import 'dart:async';

import 'package:covid_19_app/View/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const WorldStatesScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*Animated Covid Img start here*/
            AnimatedBuilder(
                animation: _controller,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  child: const Center(
                    child: Image(
                      image: AssetImage('images/virus.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: child,
                  );
                }),
            /*Animated Covid Img end here*/
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            /*last portion and Text Covid-19 Tracer start here */

            const Align(
              alignment: Alignment.center,
              child: Text(
                'Covid-19\nTracer App',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            /*last portion and Text Covid-19 Tracer end here */
          ],
        ),
      ),
    );
  }
}
