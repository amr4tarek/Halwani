import 'package:flutter/material.dart';
import 'package:halwani/constants/constants.dart';
import 'package:halwani/presentation/managers/cart/cart_provider.dart';
import 'package:halwani/presentation/views/cart/widgets/cart_list.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "سلة التسوق",
          style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "Cairo"),
        ),
        centerTitle: true,
      ),
      body: Consumer<CartProvider>(builder: (context, shop, child) {
        if (shop.getCartItems.isEmpty) {
          return const Center(
              child: Text(
            " السلة فارغة",
            style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "Cairo"),
          ));
        }
        return CartListView(shop: shop);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                title: const Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    "تمت العملية بنجاح",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Cairo"),
                  ),
                ),
                content: const Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    "شكرا لتسوقك معنا",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Cairo"),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Provider.of<CartProvider>(context, listen: false)
                          .clearCart();
                    },
                    child: Text(
                      "حسنا",
                      style: TextStyle(
                          fontSize: 16,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Cairo"),
                    ),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
