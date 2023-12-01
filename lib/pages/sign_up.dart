import 'package:flutter/material.dart';
import 'Login _page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController _emailController = TextEditingController();
TextEditingController _phoneNumber = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _confirmPassword = TextEditingController();
 bool passwordMatch = true;

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
            SizedBox(height: 70,), 
            Text("Sign Up",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
            Form  (
              key: _formKey,
              child: Column(children: [
           TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'email',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20) ),prefixIcon:Icon(Icons.email), ),
              validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the email';
                        } else if (!isValidEmail(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
            ),
            SizedBox(height: 16,),
            TextFormField(
              controller: _phoneNumber,
              decoration: InputDecoration(labelText: 'phone no.',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20) ),prefixIcon:Icon(Icons.phone), ),
              validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the phone no.';
                        } 
                        
                        return null;
                      },
            ),
              SizedBox(height: 16,),
            TextFormField(
              controller: _password,
              decoration: InputDecoration(labelText: 'password',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20) ),prefixIcon:Icon(Icons.password), ),
              validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the password';
                        } else if (value.length < 8) {
                          return 'Password should be at least 8 characters';
                        }
                        return null;
                      },
            ),
            SizedBox(height: 16,),
            TextFormField(
              controller: _confirmPassword,
              decoration: InputDecoration(labelText: 'confirm password',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20) ),prefixIcon:Icon(Icons.password), ),
              validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the password';
                        } else if (!passwordMatch) {
                          return 'password and confirm password mismatch';
                        }
                        
                        return null;
                      },
            ),

            ],)),

            SizedBox(height: 40,),
                        MaterialButton( onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      passwordMatch = _password.text ==
                          _confirmPassword.text;
                    });
                    if (passwordMatch) {
                      // Continue with registration logic
                      print('Registration successful');
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    }
                   
                  }
                },child: Text("Signup",style:TextStyle(fontWeight: FontWeight.bold),),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),color: Colors.white,height: 40,minWidth: 100,),
          ],
        ),
      ),
    );
  }
}