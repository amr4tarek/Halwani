import 'package:flutter/material.dart';
import 'package:halwani/presentation/managers/cart/cart_provider.dart';
import 'package:halwani/presentation/views/home/widgets/halwalist.dart';
import 'package:halwani/presentation/views/home/widgets/home_appbar.dart';
import 'package:halwani/presentation/views/home/widgets/promo_banar.dart';
import 'package:halwani/presentation/views/home/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartProvider shop = Provider.of<CartProvider>(context);
    List halwaiyt = shop.getHalwaiyt;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: const HomeAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          buildPromoBanner(),
          buildSearchBar(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "القائمة",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo"),
            ),
          ),
          buildHalwaList(halwaiyt, context),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
