import 'package:flutter/material.dart';

import '../../domain/entities/ProductEntity.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  const ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return productWidget(product);
  }

  productWidget(Product product) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.white, Colors.black26], stops: [0.95, 1])),
          child: Row(
            children: [
              SizedBox(
                height: double.infinity,
                width: 150,
                child: Image.network(
                  product.thumbnail.toString(),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0).copyWith(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'inter',
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        '${product.price.toString()} \$',
                        style: TextStyle(
                          fontFamily: 'inter',
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      // ListTile(
      //   dense: true,
      //   contentPadding: EdgeInsets.zero,
      //   style: ListTileStyle.list,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //   isThreeLine: true,
      //   tileColor: Color(0xff242424),
      //   leading: Container(
      //       color: Colors.red,
      //       // height: 100,
      //       width: 150,
      //       child: Image.network(
      //         product.thumbnail.toString(),
      //         fit: BoxFit.cover,
      //       )),
      //   title: Text(product.title.toString()),
      //   subtitle: Text(product.price.toString()),
      // ),
    );
  }
}
