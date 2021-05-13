import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  final int? id;
  final String? name;
  final double? price;
  final int? score;
  final String? img;

  ProductView({
    this.id,
    @required this.name,
    @required this.price,
    @required this.score,
    @required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(name!),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(16, 78, 139, 1),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Container(child: Image.asset(img!)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  name!,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                color: Colors.grey[300],
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
                              style: TextStyle(fontWeight: FontWeight.w500),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
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
                                  color: Colors.black,
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Adicionar ao carrinho',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    icon: Icon(Icons.remove), onPressed: () {}),
                                Text(
                                  '0',
                                  style: TextStyle(fontSize: 18),
                                ),
                                IconButton(
                                    icon: Icon(Icons.add), onPressed: () {}),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Container(
                        width: double.infinity,
                        color: Colors.black,
                        child: TextButton(
                          child: Text(
                            'Ver carrinho',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
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
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'R\$0,00',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
