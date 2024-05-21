import 'package:flutter/material.dart';

class ButtonOnBoard extends StatelessWidget {
  const ButtonOnBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(right: 100, top: 20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 119, 79, 9),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            "ابدأ التسوق",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Cairo",
            ),
          ),
        ),
      ),
    );
  }
}
