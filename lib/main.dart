import 'package:covid_onboarding/feature/onboard/view/onboard_screen_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'feature/onboard/view/onboard_screen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
