import 'package:agriculture/data/products.dart';
import 'package:agriculture/models/product.dart';
import 'package:agriculture/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'cart.dart';
import 'order.dart';

class CartPage extends StatefulWidget {
 const  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

   void _deleteItem(int index) {
    setState(() {
      cart.removeAt(index);
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(


     body: Column(
       children: [
         Expanded(
           child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(cart[index].image,fit: BoxFit.cover,)),
                  title: Text(cart[index].name,style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Count: ${cart[index].countincart}',),
                      Text('Total: \Rs.${calculateTotalForItem(cart[index]).toStringAsFixed(2)}'),
                      
                    ],
                  ),
                  trailing: IconButton(onPressed: (){
                      _deleteItem(index);
                    
                  }, icon:Icon(Icons.delete)),
                 
                );
              },
            ),
         ),
         
                  ElevatedButton(
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => orderPage()));
                    },
                    child: Text('Proceed to Checkout'),
                  ),
                  SizedBox(height: 30,)
       ],
     ),


    ); 
  }
   double calculateTotalForItem(Product product) {
    return product.price * product.countincart;
  }
}