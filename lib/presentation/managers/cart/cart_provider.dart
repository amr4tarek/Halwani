import 'package:flutter/material.dart';
import 'package:halwani/constants/halwaiyt.dart';
import 'package:halwani/data/model/halwa.dart';

class CartProvider extends ChangeNotifier {
  Map<Halwa, int> cart = {};
  Map<Halwa, int> get getCartItems => cart;
  List get getHalwaiyt => halwaiyt;

  void addToCart(Halwa h, int quantity) {
    if (cart.containsKey(h)) {
      cart[h] = (cart[h] ?? 0) + quantity;
    } else {
      cart[h] = quantity;
    }

    notifyListeners();
  }

  void removeFromCart(Halwa h) {
    if (cart.containsKey(h) && cart[h] != null && cart[h]! > 0) {
      cart[h] = cart[h]! - 1;
      if (cart[h]! <= 0) {
        cart.remove(h);
      }
    }

    notifyListeners();
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }
}
