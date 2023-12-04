import 'package:agriculture/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';  
import 'package:agriculture/pages/cart_page.dart';    
import 'package:agriculture/pages/cart.dart';
import 'package:agriculture/pages/cart_appbar.dart';


class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key,required this.product});

  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
int count = 1;

void addToCart(Product product) {
    var existingProduct = cart.firstWhere(
      (element) => element.name == product.name,
      orElse: () => Product(
        name: "",
        description: "",
        image: "",
        price: 0.0,
        unit: "",
        rating: 0.0,
      ),
    );

    if (existingProduct.name.isNotEmpty) {
   
      existingProduct.countincart += count;
    } else {
     
      cart.add(
        Product(
          name: product.name,
          description: product.description,
          image: product.image,
          price: product.price,
          unit: product.unit,
          rating: product.rating,
          countincart: count,
          
        ),
      );
    }

  
    setState(() {
      count = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        actions: [
          IconButton(onPressed: (){},padding: EdgeInsets.only(right: 25), icon:Icon(Icons.bookmark,size: 35))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Container(
            height: 250,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color:Colors.green,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: AssetImage(widget.product.image),fit: BoxFit.cover)     ),
          ),
          Text(widget.product.name,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Available in stock",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
              RichText(text: TextSpan(
                       children: [
                          TextSpan(
                            text: "Rs.${widget.product.price}",
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)
                          ),
                          TextSpan(
                            text: "/${widget.product.unit}",
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
                          )
                        ]
                      )
                  ),
              ],
            ),
            
          
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star,color: const Color.fromARGB(255, 222, 200, 3),),
                     Text("${widget.product.rating}",style: TextStyle(fontSize: 18),)
                    ],
                  ),
                  Row(
                    children: [

                        IconButton.filledTonal(onPressed: () {
                        setState(() {
                        if (count > 1) {
                          count--;
                        }
                      });
                      }, icon: Icon(Icons.remove,color:Color.fromARGB(255, 3, 89, 6),size: 38,)),

                      SizedBox(width: 15,),
                      
                     Text(count.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                     SizedBox(width: 15,),

                      IconButton.filledTonal(onPressed: () {
                          setState(() {
                        if (count >= 1) {
                          count++;
                        }
                      });


                      }, icon: Icon(Icons.add,color:const Color.fromARGB(255, 0, 81, 3),size: 38,)),

                    
                    ],
                  )

                  
                ],
              ),
              SizedBox( 
                height: 10,
              ),
              Text("Description",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 10,
              ),
              Text("${widget.product.description}",style: TextStyle(fontSize: 15,),textAlign:TextAlign.justify,),
              SizedBox(height: 10,),
             
               SizedBox(height: 40,),
              Row(
                
                children: [
                 
                Expanded(child: FilledButton.icon(
              onPressed: () {
               addToCart(widget.product);
               Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage1()));

              
              
              },
              icon: Icon(Icons.shopping_bag),
              label: Text("Add to cart"),
            ),)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}