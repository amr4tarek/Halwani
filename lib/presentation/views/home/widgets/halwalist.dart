import 'package:flutter/material.dart';
import 'package:halwani/Shared/halwatile.dart';
import 'package:halwani/presentation/views/details/details.dart';

Widget buildHalwaList(List halwaiyt, BuildContext context) {
  return Expanded(
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: halwaiyt.length,
      itemBuilder: (context, index) {
        return HalwaTile(
          h: halwaiyt[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(h: halwaiyt[index]),
              ),
            );
          },
        );
      },
    ),
  );
}
