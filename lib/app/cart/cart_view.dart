import 'package:flutter/material.dart';
import 'package:games/app/controller/controller.dart';
import 'package:get/get.dart';

class CartView extends GetView<Controller> {
  double getAllPrice() {
    double finalPrice = 0.0;

    controller.productsCart.map((item) {
      finalPrice += double.parse(item["price"]);
    }).toList();

    return finalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(16, 78, 139, 1),
      ),
      body: Obx(
        () => Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: controller.productsCart.length > 0
                ? Column(
                    children: controller.productsCart.map(
                      (item) {
                        return Dismissible(
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) {
                            controller.productsCart.remove(item);
                          },
                          key: ValueKey(item["id"]),
                          background: Container(
                            height: 200,
                            color: Colors.red,
                            child: Container(
                              alignment: Alignment.centerRight,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                          ),
                          child: Container(
                              child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('${item["image"]}'),
                            ),
                            title: Text(
                              '${item["quantity"]}x ${item["name"]}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Text('${item["price"]}'),
                          )),
                        );
                      },
                    ).toList(),
                  )
                : Center(child: Text('Seu carrinho está vazio :(')),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('FRETE'),
                    Text(getAllPrice() > 250
                        ? 'GRÁTIS'
                        : 'R\$ ${(controller.productsCart.length * 10.0).toStringAsFixed(2)}'),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('SUBTOTAL'),
                    Text('R\$ ${getAllPrice()}'),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TOTAL'),
                    Text(
                      'R\$ ${getAllPrice() + (getAllPrice() > 250 ? 0 : controller.productsCart.length * 10.0)}',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
