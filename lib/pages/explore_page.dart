import 'package:agriculture/models/product.dart';
import 'package:agriculture/data/products.dart';
import 'package:agriculture/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late List<Product> filteredProducts;
  @override
  void initState() {
    filteredProducts = List.from(products);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
          children: [
            
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Expanded( 
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search here...",
                        isDense:true,
                         contentPadding: const EdgeInsets.all(12),
                         border:OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade50,   
                                           ),     
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                        ),
                        prefixIcon: Icon(IconlyLight.search),
                         ),
                        ),
                     ),
              
                 Padding(padding: const EdgeInsets.all(1),
                 child: IconButton.filled(onPressed: () {}, 
                 icon: const Icon(IconlyLight.filter),
                 ),
                 ),
                   ],
              ),
            ),
          
          Padding(
            padding: const EdgeInsets.only(bottom:12),
            child: SizedBox(
                height:  170,
                child: Card(
                  color: Colors.green.shade50,
                  shadowColor: Colors.green.shade100,
                  elevation:0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Free Consultation",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )
                            
                            ),
                            Text("Get free support from our customer serviceSS"),
                            FilledButton(onPressed: () {}, child:Text("call now"))
                                      
                          ],
                        ),
                      ),
                      Image.asset("assets/contact_us.png",width: 140,)
                  
                    ]),
                  ),
          
                )
                
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Featured Product"),
              TextButton(onPressed: () {}, child: Text("see all"))
            ],
          ), 
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: products.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing:8,childAspectRatio:0.8), 
                      itemBuilder: (context,index){
                          return  ProductCard(product: products[index],);
                          },
                      ) 
          ],
      ),
  
      
     
    );
  }
}