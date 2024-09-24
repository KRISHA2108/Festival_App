import 'package:fastival_application/Utils/fonts_utils.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../Utils/Routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    Timer.periodic(
      const Duration(
        seconds: 3,
      ),
      (timer) {
        Navigator.of(context).pushReplacementNamed(Routes.homePage);
        timer.cancel();
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: s.height,
            width: s.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'lib/assets/images/Splash.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                "Festival's",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: fastivalFontFamily[6].fontFamily,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
