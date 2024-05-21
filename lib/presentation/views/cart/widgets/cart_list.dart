import 'package:flutter/material.dart';
import 'package:halwani/presentation/managers/cart/cart_provider.dart';

class CartListView extends StatelessWidget {
  final CartProvider shop;

  CartListView({required this.shop});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shop.getCartItems.length,
      itemBuilder: (context, index) {
        var item = shop.getCartItems.keys.elementAt(index);
        var quantity = shop.getCartItems[item];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(15),
          child: ListTile(
            title: Text(
              item.name,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo"),
            ),
            subtitle: Text(
              "السعر: ${item.price} جنيه\nالكمية: $quantity",
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo"),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red, size: 30),
              onPressed: () {
                shop.removeFromCart(item);
              },
            ),
          ),
        );
      },
    );
  }
}
