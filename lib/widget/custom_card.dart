import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

import '../screens/update_product_page.dart';

class customCard extends StatelessWidget {
   customCard({required this.product_model,Key? key}) : super(key: key);

  ProductModel product_model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context , UpdateProductPage.id,arguments: product_model, );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [ BoxShadow(
              color: Colors.grey.withOpacity(.1),
              blurRadius: 40,
              offset: Offset(10,10),

            )]),
            child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all( 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${product_model.title}'.substring(0,6),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15),
                      ),
                      SizedBox(height: 3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$''${product_model.price}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15),
                          ),
                          Icon(Icons.favorite,color: Colors.red,),
                        ],)
                    ],
                  ),
                )
            ),
          ),
          Positioned(
            right: 32,
            top: -60,
            child: Image.network(
              product_model.image,
              height: 200,
              width: 200,
            ),

          ),
        ],
      ),
    );
  }
}
