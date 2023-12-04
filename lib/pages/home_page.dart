import 'package:agriculture/pages/cart_appbar.dart';
import 'package:agriculture/pages/cart_page.dart';
import 'package:agriculture/pages/explore_page.dart';
import 'package:agriculture/pages/profile_page.dart';
import 'package:agriculture/pages/services_page.dart';
import 'package:agriculture/pages/Login _page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'cart_appbar.dart';
import 'package:badges/badges.dart' as badges;


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final pages = [const ExplorePage(),const ServicesPage(),const CartPage(),const ProfilePage()];
int currentIndex=0;



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        surfaceTintColor: Color.fromARGB(255, 54, 165, 14),
       
        child:Column(
          children: [
            SizedBox(height:50 ,),
             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 43,
                    child: CircleAvatar(backgroundColor: Colors.white,radius: 39,
                    foregroundImage: AssetImage('assets/anuraj.jpeg'),
                    ),
                    
                    
                         ),
                         SizedBox(width: 30,),
                         Column(
                           children: [
                            SizedBox(height: 10,),
                             Text('Anuraj',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                              Text('anuraj@gmail.com',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                           ],
                         ),
                          
                 ],
               ),
             ),
             SizedBox(height: 60,),
            ListTile(
                  title: const Text("Profile"),
                  leading: const Icon(IconlyBold.profile),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                  },

                ),
                ListTile(
                  title: const Text("Cart"),
                  leading: const Icon(Icons.shopping_bag),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage1()));
                  },

                ),
                ListTile(
                  title: const Text("Logout"),
                  leading: const Icon(Icons.logout),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },

                ),
          ],
        )
                
      ),
      appBar: AppBar(
      
        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi Anuraj ", style: Theme.of(context).textTheme.titleMedium),
            Text("Enjoy our service",style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton.filledTonal(
              
              onPressed: () {},
              icon: badges.Badge(
                badgeContent: const Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                position: badges.BadgePosition.topEnd(top: -15, end: -12),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.green,
                ),
                child: const Icon(IconlyBroken.notification),
              ),
            ),
          ),
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
        items: const [
            BottomNavigationBarItem(icon: Icon(IconlyLight.home,color: Colors.black,),activeIcon:Icon(IconlyBold.home,color: Colors.green,) ,label: "Home",),
            BottomNavigationBarItem(icon: Icon(IconlyLight.category,color: Colors.black,),activeIcon:Icon(IconlyBold.category,color: Colors.green,),label: "Services",),
            BottomNavigationBarItem(icon: Icon(IconlyLight.buy,color: Colors.black,),activeIcon:Icon(IconlyBold.buy,color: Colors.green,),label: "cart",),
            BottomNavigationBarItem(icon: Icon(IconlyLight.profile,color: Colors.black,),activeIcon:Icon(IconlyBold.profile,color: Colors.green,),label: "Profile",),

        ],
      ),
    );
  }
}