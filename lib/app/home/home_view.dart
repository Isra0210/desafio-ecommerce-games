import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:games/app/cart/cart_view.dart';
import 'package:games/app/controller/controller.dart';
import 'package:games/app/home/widget/product_widget.dart';
import 'package:games/app/product/product_view.dart';
import 'package:get/get.dart';

class HomeView extends GetView<Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games'),
        backgroundColor: Color.fromRGBO(16, 78, 139, 1),
        // backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: 20,
                ),
                Positioned(
                  left: 8.0,
                  bottom: 6.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 8,
                    child: Obx(
                      () => Text(
                        '${controller.productsCart.length}',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartView(),
              ),
            ),
          ),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString("assets/data/products.json"),
          builder: (ctx, snap) {
            List<dynamic> productList =
                List.from(json.decode(snap.data.toString()));
            return ListView.builder(
              itemBuilder: (ctx, i) {
                if (!snap.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                          Color.fromRGBO(16, 78, 139, 1)),
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductView(
                          id: productList[i]["id"],
                          image: 'assets/${productList[i]["image"]}',
                          name: productList[i]["name"],
                          price: productList[i]["price"],
                          score: productList[i]["score"],
                        ),
                      ),
                    ),
                    child: ProductWidget(
                      id: productList[i]["id"],
                      image: 'assets/${productList[i]["image"]}',
                      name: productList[i]["name"],
                      price: productList[i]["price"],
                      score: productList[i]["score"],
                    ),
                  );
                }
              },
              itemCount: productList.length,
            );
          },
        ),
      ),
    );
  }
}
