import 'package:flutter/material.dart';
import 'package:agriculture/pages/home_page.dart';
import 'package:agriculture/pages/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }
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
            Form(
              key: _formKey,
              child: Column(
                    children: [
                     TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'email',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20) ),prefixIcon:Icon(Icons.email) ),
              validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the email';
                        } else if (!isValidEmail(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
            ),
            SizedBox(height: 25,),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'password',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20) ),prefixIcon:Icon(Icons.email), ),
              validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the password';
                        } else if (value.length < 8) {
                          return 'Password should be at least 8 characters';
                        }
                        return null;
                      },
            ),
                    ],

              ) ),
            SizedBox(height: 20,),
            MaterialButton(onPressed: (){
         if(_formKey.currentState!.validate()){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

         }
            },child: Text("Login",style:TextStyle(fontWeight: FontWeight.bold)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),color: Colors.white,height: 40,minWidth: 100,),
            SizedBox(height: 20,),
            TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));}, child: Text("Don't have an account ?",style: TextStyle(fontSize: 15),))

            
                   
                   ],
            ),
          ),
    );
  }
}