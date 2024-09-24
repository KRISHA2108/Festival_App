import 'package:flutter/material.dart';

import 'Pages/DetailPage/detail_page.dart';
import 'Pages/EditPage/edit_page.dart';
import 'Pages/HomePage/home_page.dart';
import 'Pages/splash_screen/splash_screen.dart';
import 'Utils/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.splash: (context) => const SplashScreen(),
        Routes.homePage: (context) => const HomePage(),
        Routes.detailPage: (context) => const DetailPage(),
        Routes.editPage: (context) => const EditPage(),
      },
    );
  }
}
