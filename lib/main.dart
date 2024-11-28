import 'package:demo/contactme.dart';
import 'package:demo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Contact Info'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.teal,
        alignment: Alignment.center,

        child: Column(
          mainAxisSize: MainAxisSize.min, // Minimize vertical space taken
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/img.png'),
            ),
            // Container(
            //   child: ,
              // child: Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ClipOval(
              //      child: Image.asset('assets/images/img.png'
              //      ),
              //   ),
              // ),
            //   width: 150,
            //   height: 150,
            // ),
            SizedBox(
              height: 25.0,
              width: 250.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(Icons.person,
                          color: Colors.black,),
                        ),
                        Text("Rishabh Dosi", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, )),
                      ],
                    ) ),
              ),
            ),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(Icons.phone,
                            color: Colors.black,),
                        ),
                        Text("8319873365", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, )),
                      ],
                    ) ),
              ),
            ),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(Icons.email,
                            color: Colors.black,),
                        ),
                        Text("rishabh.dosi11@qualimatrix.tech", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, )),
                      ],
                    ) ),
              ),
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Contactme(), // Navigate to ContactMe
                ),
              );
            }, child: Text("Contact Me"))
          ],
        )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
