import 'package:agriculture/data/products.dart';
import 'package:agriculture/models/product.dart';
import 'package:agriculture/pages/order.dart';
import 'package:agriculture/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'cart.dart';

class CartPage1 extends StatefulWidget {
 const  CartPage1({super.key});

  @override
  State<CartPage1> createState() => _CartPage1State();
}

class _CartPage1State extends State<CartPage1> {

   void _deleteItem(int index) {
    setState(() {
      cart.removeAt(index);
    });
  }

  
  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(
        title: Text("Cart", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 230),
            child: Icon(IconlyLight.bag),
          )
        ],
        backgroundColor: Color.fromARGB(255, 168, 255, 170),
      ),
      body: Column(
        children: [
          if (cart.isEmpty)
            Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 18),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(cart[index].image, fit: BoxFit.cover),
                    ),
                    title: Text(cart[index].name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Count: ${cart[index].countincart}'),
                        Text('Total: \Rs.${calculateTotalForItem(cart[index]).toStringAsFixed(2)}'),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        _deleteItem(index);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
          if (cart.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Price: \Rs.${calculateTotalPrice().toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => orderPage()));
                    },
                    child: Text('Proceed to Checkout'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,)
        ],
      ),
    );
  }

  double calculateTotalForItem(Product product) {
    return product.price * product.countincart;
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (var product in cart) {
      total += calculateTotalForItem(product);
    }
    return total;
  }
}