import 'package:flutter/material.dart';
import 'package:halwani/data/model/halwa.dart';

class HalwaTile extends StatelessWidget {
  final Halwa h;
  final void Function()? onTap;

  const HalwaTile({super.key, required this.h, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              h.image,
              width: 150,
              height: 150,
            ),
            Text(
              h.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "السعر: ${h.price} جنيه",
                    style: const TextStyle(
                        fontSize: 15, color: Colors.grey, fontFamily: "Cairo"),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 20,
                  ),
                  Text(
                    "التقييم: ${h.rating}",
                    style: const TextStyle(
                        fontSize: 15, color: Colors.grey, fontFamily: "Cairo"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
