import 'package:flutter/material.dart';
import 'package:games/app/home/widget/product_widget.dart';

class HomeView extends StatelessWidget {
  final List<Map<String, dynamic>> productList = [
    {
      "id": 312,
      "name": "Super Mario Odyssey",
      "price": 197.88,
      "score": 100,
      "image": "super-mario-odyssey.png"
    },
    {
      "id": 201,
      "name": "Call Of Duty Infinite Warfare",
      "price": 49.99,
      "score": 80,
      "image": "call-of-duty-infinite-warfare.png"
    },
    {
      "id": 102,
      "name": "The Witcher III Wild Hunt",
      "price": 119.5,
      "score": 250,
      "image": "the-witcher-iii-wild-hunt.png"
    },
    {
      "id": 99,
      "name": "Call Of Duty WWII",
      "price": 249.99,
      "score": 205,
      "image": "call-of-duty-wwii.png"
    },
    {
      "id": 12,
      "name": "Mortal Kombat XL",
      "price": 69.99,
      "score": 150,
      "image": "mortal-kombat-xl.png"
    },
    {
      "id": 74,
      "name": "Shards of Darkness",
      "price": 71.94,
      "score": 400,
      "image": "shards-of-darkness.png"
    },
    {
      "id": 31,
      "name": "Terra Média: Sombras de Mordor",
      "price": 79.99,
      "score": 50,
      "image": "terra-media-sombras-de-mordor.png"
    },
    {
      "id": 420,
      "name": "FIFA 18",
      "price": 195.39,
      "score": 325,
      "image": "fifa-18.png"
    },
    {
      "id": 501,
      "name": "Horizon Zero Dawn",
      "price": 115.8,
      "score": 290,
      "image": "horizon-zero-dawn.png"
    }
  ];

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
        child: Container(
          child: ListView(
            children: productList
                .map(
                  (prod) => ProductWidget(
                    img: 'assets/${prod["image"]}',
                    name: prod["name"],
                    price: prod["price"],
                    score: prod["score"],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
