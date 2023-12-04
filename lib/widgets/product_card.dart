import 'package:agriculture/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:agriculture/pages/product_details.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsPage(product: product)));
      },
      child: Card(
        clipBehavior:Clip.antiAlias,
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: Colors.grey.shade400)
        ),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              alignment: Alignment.topRight,
              width:double.infinity,
              padding: EdgeInsetsDirectional.all(8),
              decoration: BoxDecoration(
                image:DecorationImage(image:AssetImage(product.image),
                fit: BoxFit.cover
                
                )
              ),
              child:SizedBox(
                height: 28,
                width: 28,
                child: IconButton.filledTonal(
                  padding: EdgeInsetsDirectional.zero,
                  onPressed: (){}, icon:(Icon(IconlyLight.bookmark)),iconSize: 15,)),
            ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,style: TextStyle(color: Colors.black,fontSize:18,fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                   
                      RichText(text: TextSpan(
                       children: [
                          TextSpan(
                            text: "Rs.${product.price}",
                            style: TextStyle(color: Colors.black)
                          ),
                          TextSpan(
                            text: "/${product.unit}",
                            style: TextStyle(color: Colors.black)
                          )
                        ]
                      )
                      ),
                      
                  
                  ],
                )
              ],
             ),
           )
    
          ],
        ),
      ),
    );
  }
}