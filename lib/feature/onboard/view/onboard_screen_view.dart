// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:covid_onboarding/feature/onboard/model/onboard_model.dart';
import 'package:kartal/kartal.dart';
import 'package:covid_onboarding/product/compenents/app_string.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [Expanded(child: _buildPageViewController(context))],
      ),
    );
  }

  PageView _buildPageViewController(BuildContext context) {
    return PageView.builder(
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: models.length,
        itemBuilder: (_, i) {
          return Expanded(child: _buildMain(i, context));
        });
  }

  Column _buildMain(int i, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          models[i].image,
          height: context.dynamicHeight(0.6),
        ),
        Container(
          height: context.dynamicHeight(0.4),
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Column(children: [
            SizedBox(
              height: context.dynamicHeight(0.03),
            ),
            _navigationItemsRow(),
            SizedBox(height: context.dynamicHeight(0.03)),
            Text(
              models[i].title,
              textAlign: TextAlign.center,
              style: context.textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24),
            ),
            SizedBox(height: context.dynamicHeight(0.03)),
            Text(
              models[i].description,
              textAlign: TextAlign.center,
              style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 20),
            ),
            SizedBox(
              height: context.dynamicHeight(0.10),
            ),
            _buttonPageNavigiton(context)
          ]),
        )
      ],
    );
  }

  Container _navigationItemsRow() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            List.generate(models.length, (index) => _buildItemsPage(index)),
      ),
    );
  }

  Container _buttonPageNavigiton(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                minimumSize: Size(
                    context.dynamicWidth(0.3), context.dynamicHeight(0.3))),
            onPressed: () {
              if (currentIndex == models.length - 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => _buildMain(0, context)));
              }
              _controller?.nextPage(
                  duration: context.durationNormal, curve: Curves.bounceIn);
            },
            child: Text(AppString().skipButton.toString()),
          ),
          SizedBox(
            width: context.dynamicWidth(0.05),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                minimumSize: Size(
                    context.dynamicWidth(0.3), context.dynamicHeight(0.3))),
            onPressed: () {
              if (currentIndex == models.length - 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => _buildMain(0, context)));
              }
              _controller?.nextPage(
                  duration: context.durationNormal, curve: Curves.bounceIn);
            },
            child: Text(AppString().NextButton.toString()),
          )
        ],
      ),
    );
  }

  Container _buildItemsPage(int index) {
    return Container(
      height: context.dynamicHeight(0.015),
      width: context.dynamicWidth(0.030),
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.orange : Colors.grey,
          border: Border.all(color: context.appTheme.primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(30))),
    );
  }
}
