import 'package:flutter/material.dart';
import 'package:games/app/cart/cart_view.dart';
import 'package:games/app/controller/controller.dart';
import 'package:get/get.dart';

class ProductView extends GetView<Controller> {
  final int? id;
  final String? name;
  final double? price;
  final int? score;
  final String? image;

  ProductView({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.score,
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(name!),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(16, 78, 139, 1),
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
                    child: Text(
                      '${controller.productsCart.length}',
                      style: TextStyle(fontSize: 12, color: Colors.white),
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
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Container(
                  child: Image.asset(
                image!,
                width: double.infinity,
                height: 250,
              )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  name!,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Valor: R\$ ${price!}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Score: ',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.orange,
                                ),
                                Text(
                                  '${score!}',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(16, 78, 139, 1),
        height: 120,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      Text(
                        'R\$ ${(controller.amount(controller.quantity.value, price!)).toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                            ),
                            child: TextButton(
                              onPressed: controller.quantity.value > 0
                                  ? () {
                                      controller.productsCart.add({
                                        "id": id,
                                        "name": name,
                                        "image": image,
                                        "score": score,
                                        "price": price,
                                        "quantity": controller.quantity.value,
                                      });
                                      controller.quantity.value = 0;
                                      Navigator.pop(context);
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Adicionar ao carrinho',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            children: [
                              controller.quantity.value > 0
                                  ? IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () =>
                                          controller.quantity.value--,
                                      color: Colors.white,
                                    )
                                  : Container(),
                              Text(
                                '${controller.quantity.value}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () => controller.quantity.value++,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
