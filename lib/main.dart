import 'package:covid_onboarding/feature/onboard/view/onboard_screen_view.dart';
import 'package:flutter/material.dart';
import 'feature/onboard/view/onboard_screen_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
        title: 'MaterialAppp',
        debugShowCheckedModeBanner: false,
        home: const OnBoardScreen());
  }
}
