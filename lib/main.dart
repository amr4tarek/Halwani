import 'package:flutter/material.dart';
import 'package:halwani/constants/constants.dart';
import 'package:halwani/presentation/views/cart/cart.dart';
import 'package:halwani/presentation/views/home/home.dart';
import 'package:halwani/presentation/views/onboard/onboard.dart';
import 'package:halwani/presentation/managers/cart/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => CartProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      ),
      debugShowCheckedModeBanner: false,
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: OnBoarding(),
      ),
      routes: {
        '/onboarding': (context) => OnBoarding(),
        '/home': (context) => HomePage(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}
