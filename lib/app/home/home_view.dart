import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:games/app/home/widget/product_widget.dart';
import 'package:games/app/product/product_view.dart';

class HomeView extends StatelessWidget {
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
            icon: Icon(
              Icons.shopping_cart,
              size: 20,
            ),
            onPressed: () => null,
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
            List<dynamic> productList = json.decode(snap.data.toString());
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
                          img: 'assets/${productList[i]["image"]}',
                          name: productList[i]["name"],
                          price: productList[i]["price"],
                          score: productList[i]["score"],
                        ),
                      ),
                    ),
                    child: ProductWidget(
                      img: 'assets/${productList[i]["image"]}',
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
