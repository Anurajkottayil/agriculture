import 'package:agriculture/models/product.dart';
import 'package:agriculture/pages/cart_appbar.dart';
import 'package:agriculture/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'cart.dart';

class orderPage extends StatefulWidget {
  const orderPage({super.key});

  @override
  State<orderPage> createState() => _orderPageState();
}

class _orderPageState extends State<orderPage> {

  void _dialogebox(){
    showDialog(
      context: context,
      builder: (context){
        return Dialog(
          child: Container(
            height: 200,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
             
              children: [
                Text("Order Placed Successfully"),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                }, child: Text("Continue Shopping"))
              ],
            ),
          ),
        );
      }
    );
  }
  
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController addressController = TextEditingController();
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
 
  double TotalPriceAfterDiscount() {
    double total = 0.0;
    for (var product in cart) {
      total += calculateTotalForItem(product);
    }
    double ds =total- ((total*10)/100);    return ds;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column
          (
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
            SizedBox(height: 20,),
            Text("Checkout",style: TextStyle(fontSize:30,fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            Column(
              children: [
                Card(
                  elevation: 4,
                  color: Color.fromARGB(255, 255, 255, 255),
                   shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
                  child: Container(
                    width: 400,
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              
                              children: [
                                SizedBox(height: 40,),
                                Text("Total MRP            :", style: TextStyle(fontSize: 20),),
                                SizedBox(width: 70,),
                                 Text(
                                                '\₹  ${calculateTotalPrice().toStringAsFixed(2)}',
                                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                              ),
                                
                                
                              ],
                            ),
                          ),
                           Row(
                            
                            children: [
                              SizedBox(height: 40,),
                              Text("Shipping Charge :", style: TextStyle(fontSize: 20),),
                              SizedBox(width: 70,),
                               Text(
                      "FREE",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.green),
                    ),
      
                              
                            ],
                          ),
                           Row(
                            
                            children: [
                              SizedBox(height: 40,),
                              Text("Discount Applied :", style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 243, 33, 33)),),
                              SizedBox(width: 70,),
                               Text(
                      "10%",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
      
                              
                            ],
                          ),
                          SizedBox(height: 10,),
                          Divider(
              color: Colors.black,
              thickness: 2.0, // You can adjust the thickness of the line
            ),
      
            SizedBox(height: 20,),
            Row(
              children: [
                  SizedBox(height: 20,),
                              Text("TOTAL :", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.black),),
                              SizedBox(width: 70,),
                               Text(
                     '\₹  ${TotalPriceAfterDiscount().toStringAsFixed(2)} ' ,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
      
                
              ],
            )
                        ],
                      ),
                    ),
      
                  )
                )
              ],
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Mode of Payment :  ",style: TextStyle(fontSize: 16),),
                      Text("COD (Cash on Delivery)",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),)
                    ],
                  ),
                   SizedBox(height: 30,),
                   Text("shipping Address"),
                   SizedBox(height: 10,),
                   Form(
                    key:_formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(children: [
                        TextFormField( 
                          controller: addressController,
                          maxLines: 4,
                          decoration: InputDecoration(border: OutlineInputBorder())
                        ),
                        SizedBox(height: 10,),
                        MaterialButton(onPressed: (){

                          _dialogebox();

        
            },child: Text("Confirm Order",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),color: const Color.fromARGB(255, 0, 0, 0),height: 40,),
                          
                                       ],),
                    ))
      
                  
            
              ],),
            ),
        
          ]),
        ),
      ),
    );
  }
}