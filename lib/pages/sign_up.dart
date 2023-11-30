import 'package:flutter/material.dart';
import 'Login _page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 182, 228, 183),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            SizedBox(height: 70,), 
            Text("Sign Up",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
             TextField(decoration: InputDecoration(hintText: 'Email',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20) ),prefixIcon:Icon(Icons.email) ),),
            SizedBox(height: 20,),
              TextField(decoration: InputDecoration(hintText: 'Phone no.',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20) ),prefixIcon:Icon(Icons.phone) ),),
            SizedBox(height: 20,),
             TextField(decoration: InputDecoration(hintText: 'Password',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),prefixIcon:Icon(Icons.password)),),
            SizedBox(height: 20,),
            TextField(decoration: InputDecoration(hintText: 'Confirm Password',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),prefixIcon:Icon(Icons.password)),),
            SizedBox(height: 40,),
                        MaterialButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) => LoginPage()));
            },child: Text("Signup",style:TextStyle(fontWeight: FontWeight.bold),),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),color: Colors.white,height: 40,minWidth: 100,),
          ],
        ),
      ),
    );
  }
}