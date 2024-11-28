import 'package:demo/contactme.dart';
import 'package:demo/readData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => LoginState();
    // TODO: implement createState
    
  

}

class LoginState extends State<Login> {
  final firebaseAuth = FirebaseAuth.instance;
  final emailText = TextEditingController();
  final passwordText = TextEditingController();
  handleSignIn() async {
    try{
      print(emailText.text);
      await firebaseAuth.signInWithEmailAndPassword(
        email: emailText.text,
        password: passwordText.text,
      );
      // Handle success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login successful!')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ReadData(), // Navigate to ContactMe
        ),
      );

    } on FirebaseAuthException catch(e){
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Login As Admin", style: TextStyle(fontWeight: FontWeight.w500),),
        backgroundColor: Colors.green,

      ),
      body: Padding(padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: emailText,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                ),

              ),
            ),
            Container(
              child: TextField(
                controller: passwordText,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: ElevatedButton(onPressed:(){handleSignIn();} , child: Text("Login with google"),
              )
              ),
            ),
          ],
        )),
    );


  }
}
