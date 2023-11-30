import 'package:flutter/material.dart';
import 'package:agriculture/pages/home_page.dart';
import 'package:agriculture/pages/sign_up.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Color.fromARGB(255, 182, 228, 183),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
                   children: [
                    SizedBox(height: 30,),
             Card(
      elevation: 1000.0,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            'assets/onboarding.png',
            width: double.infinity,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
           
          ),
        ],
      ),
             ),
            SizedBox(height: 30,),
            Text("Login",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            TextField(decoration: InputDecoration(hintText: 'Email',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20) ),prefixIcon:Icon(Icons.email) ),),
            SizedBox(height: 20,),
            TextField(decoration: InputDecoration(hintText: 'Password',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),prefixIcon:Icon(Icons.password)),obscureText:true,),
            SizedBox(height: 20,),
            MaterialButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => HomePage()));
            },child: Text("Login",style:TextStyle(fontWeight: FontWeight.bold)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),color: Colors.white,height: 40,minWidth: 100,),
            SizedBox(height: 20,),
            TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));}, child: Text("Don't have an account ?",style: TextStyle(fontSize: 15),))

            
                   
                   ],
            ),
          ),
    );
  }
}