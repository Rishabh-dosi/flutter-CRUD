import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods{
  final fireStore = FirebaseFirestore.instance;
  create(Message message){
    try{
      fireStore.collection("enquiry").add({"email": message.email , "message": message.message});
    }catch(e){
      print(e.toString());
    }
  }
  Future<List<dynamic>> read() async{
    try {
      final response = await fireStore.collection("enquiry").get();
      List<Message> messages =[];
      for (var doc in response.docs) {
        messages.add(Message(
          email: doc["email"],
          message: doc["message"],
          id: doc.id,
        ));// Print each document's data
      }
      return messages;

    } on Exception catch (e) {
      // TODO
      print(e.toString());
      return [];
    }
  }
  delete(id){
    return fireStore.collection("enquiry").doc(id).delete();
  }
}

class Message{
  final String email;
  final String message;
  final String? id;
  Message({required this.message , required this.email , this.id});
}