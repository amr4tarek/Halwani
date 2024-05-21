import 'package:flutter/material.dart';
import 'package:halwani/constants/constants.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "حلواني",
        style: TextStyle(
            fontSize: 26,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo"),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.menu),
        color: Colors.black,
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          color: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Colors.grey.withOpacity(0.8),
          height: 1.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
