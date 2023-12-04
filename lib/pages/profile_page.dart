import 'package:agriculture/pages/cart_appbar.dart';
import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'Login _page.dart';
import 'cart_appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: ListView(
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 62,
              child: CircleAvatar(backgroundColor: Colors.white,radius: 60,
              foregroundImage: AssetImage('assets/anuraj.jpeg'),
              ),
              
            ),
            Column(
              children: [
                SizedBox(height: 10,),
                Center(
                 child: Text("Anuraj",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,fontFamily:AutofillHints.birthday),) ,
                ),
                Center(
                  child: Text("anurajkottayil@gmail.com",style: TextStyle(fontFamily:AutofillHints.email ),),
                ),
                SizedBox(height: 100,),
                ListTile(
                  title: const Text("My cart"),
                  leading: const Icon(Icons.shopping_basket),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage1()));
                  },

                ),
                ListTile(
                  title: const Text("About Us"),
                  leading: const Icon(Icons.info),
                  onTap: (){},
                 

                ),
                ListTile(
                  title: const Text("Logout"),
                  leading: const Icon(Icons.logout),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },

                )
              ],
            )
          ],
        ),
      ),

    );
  }
}