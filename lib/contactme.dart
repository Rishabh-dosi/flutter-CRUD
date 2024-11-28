import 'package:demo/LoginPage.dart';
import 'package:demo/database_methods.dart';
import 'package:demo/readData.dart';
import 'package:flutter/material.dart';

class Contactme extends StatefulWidget {
  const Contactme({super.key});

  @override
  State<Contactme> createState() => _ContactmeState();
}

class _ContactmeState extends State<Contactme> {
  final _dbService = DataBaseMethods();
  var emailText = TextEditingController();
  var messageText = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailText.dispose();
    messageText.dispose();
  }
  void sendFn(){
    print("Your Enquiry has been sent and your email: ${emailText.text.toString()} has been recorded");
    _dbService.create(Message(message: messageText.text.toString(), email: emailText.text.toString()));
    emailText.clear();
    messageText.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Me"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.all(8.0),
            child:Text("Submit Your Enquiry" , style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),) ,),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  controller: emailText,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 3,
                      )
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),


                    ),
                    prefixIcon: Icon(Icons.mail),


                  ),


                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  controller: messageText,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),

                      ),
                    prefixIcon: Icon(Icons.message),
                    hintText: "Enter your message here",
                  ),

                ),
              ),
            ),
            Container(
              child: ElevatedButton(onPressed: sendFn, child: Text("Send")

              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(), // Navigate to ContactMe
          ),
        );
      } ,
        child: Icon(Icons.read_more),

      ),
    );
  }
}
