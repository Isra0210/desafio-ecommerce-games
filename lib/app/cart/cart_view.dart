import 'package:flutter/material.dart';
import 'package:games/app/controller/controller.dart';
import 'package:get/get.dart';

class CartView extends GetView<Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(16, 78, 139, 1),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: controller.productsCart.map((item) {
              print(item);
              return Container(
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
              ));
            }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('FRETE'),
                  Text('R\$ 0.0'),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TOTAL'),
                  Text('R\$ 0.0'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
