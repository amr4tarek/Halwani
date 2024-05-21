import 'package:flutter/material.dart';
import 'package:halwani/constants/constants.dart';
import 'package:halwani/presentation/views/onboard/widgets/button_onboard.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "حلواني",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontFamily: "Cairo",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  'assets/intropage.png',
                  width: 250,
                  height: 250,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "لتذوق الحلويات الشرقية اللذيذة",
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              Text(
                "نقدم لكم أفضل الحلويات الشرقية بأجود المكونات",
                style: TextStyle(
                  fontFamily: "Cairo",
                  color: Colors.grey[200],
                ),
              ),
              const ButtonOnBoard(),
            ],
          ),
        ));
  }
}
