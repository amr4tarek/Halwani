import 'package:flutter/material.dart';
import 'package:halwani/Shared/button.dart';
import 'package:halwani/constants/constants.dart';
import 'package:halwani/data/model/halwa.dart';
import 'package:halwani/presentation/managers/cart/cart_provider.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final Halwa h;
  const DetailsPage({Key? key, required this.h}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int quantity = 0;

  void decrement() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  void increment() {
    setState(() {
      quantity++;
    });
  }

  Widget buildCairoText(
      String text, double fontSize, FontWeight fontWeight, Color color) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontFamily: "Cairo"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerRight,
          child: buildCairoText("حلواني", 20, FontWeight.bold, Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              Image.asset(
                widget.h.image,
                width: double.infinity,
                height: 200,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${widget.h.rating}",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: buildCairoText(
                    widget.h.name, 30, FontWeight.bold, Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              //description
              Directionality(
                textDirection: TextDirection.rtl,
                child:
                    buildCairoText("الوصف", 15, FontWeight.bold, Colors.grey),
              ),

              Directionality(
                textDirection: TextDirection.rtl,
                child: buildCairoText(
                    widget.h.description, 15, FontWeight.normal, Colors.grey),
              ),
            ],
          ),
        )),
        Container(
          padding: EdgeInsets.all(10),
          color: primaryColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCairoText("السعر: ${widget.h.price} جنيه", 20,
                      FontWeight.normal, Colors.white),
                  Row(
                    children: [
                      //minus button
                      Container(
                        decoration: BoxDecoration(
                            color: Scolor, shape: BoxShape.circle),
                        child: IconButton(
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          onPressed: decrement,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      //quantity
                      Text(
                        quantity.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),

                      //plus button
                      Container(
                        decoration: BoxDecoration(
                            color: Scolor, shape: BoxShape.circle),
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: increment,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Button(
                text: "أضف إلى السلة",
                onTap: () {
                  if (quantity > 0) {
                    //add to cart
                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart(widget.h, quantity);
                    //show dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          //border
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          title: buildCairoText("تمت الإضافة إلى السلة", 20,
                              FontWeight.normal, primaryColor),
                          content: buildCairoText(
                              "تمت إضافة ${widget.h.name} بكمية $quantity إلى السلة",
                              15,
                              FontWeight.normal,
                              Colors.grey),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: buildCairoText("حسنا", 15,
                                    FontWeight.normal, primaryColor)),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
