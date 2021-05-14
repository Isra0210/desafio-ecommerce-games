import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final int? id;
  final String? name;
  final double? price;
  final int? score;
  final String? image;

  ProductWidget({
    this.id,
    @required this.name,
    @required this.price,
    @required this.score,
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: 130,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 5),
              child: Image.asset(
                image!,
                height: 120,
                width: 120,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Text(
                        name!,
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'R\$ ${price!}',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.orange,
                            ),
                            Text('${score!}'),
                          ],
                        ),
                      ],
                    ),
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
