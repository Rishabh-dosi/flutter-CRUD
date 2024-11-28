import 'package:demo/LoginPage.dart';
import 'package:demo/database_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadData extends StatefulWidget {
  const ReadData({super.key});

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  final DataBaseMethods _dbMethods = DataBaseMethods();  // Initialize the DataBaseMethods

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read Equiries"),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _dbMethods.read(),  // Fetch data from Firestore using the read function
        builder: (context, snapshot) {
          // Loading State
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Error State
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // No Data State
          if (!snapshot.hasData || snapshot.data!.isEmpty) {

            return Center(child: Text('No messages found.'));
          }

          // Data Loaded State
          List<dynamic> messages = snapshot.data!;  // Get the list of messages

          return ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              Message message = messages[index];

              return Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                  title: Text(message.email, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(message.message),
                  trailing: IconButton(onPressed: () => _dbMethods.delete(message.id), icon: Icon(Icons.delete)),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        FirebaseAuth.instance.signOut();
        Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => Login(), // Navigate to ContactMe
            ));
      },child: Icon(Icons.logout)),
    );
  }
}
