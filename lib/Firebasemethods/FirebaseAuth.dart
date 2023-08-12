import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_task/models/User.dart';


class Firebaseauth {
 Future<String> SignupUser(String email,String password,String username) async{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore=FirebaseFirestore.instance;
  var res='';
 if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty){
  
  try{
 res="some thing is wrong";
     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    UserModel user=UserModel(email:email , password: password, username: username);
    await _firestore.collection('users').doc(userCredential.user!.uid).set(user.toJson());
    res="sucess";
    }
  
  catch(e){
    print(e.toString());
    
  }

return res;

  }

return "email or password is empty or wrong";
  }
  
Future<String> loginUser(String email, String password) async {
 
  var res="some thing is wrong"; try {
   
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(email: email, password: password);
    print('User logged in successfully');
    res="sucess";
  
  } catch (e) {
    print('Error logging in: $e');
    res=e.toString();
     }
     return res;


}

   Future<String?> getUserName() async {
     final FirebaseFirestore _firestore = FirebaseFirestore.instance;
     final FirebaseAuth _auth=FirebaseAuth.instance;
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('users').doc(_auth.currentUser!.uid).get();
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      
        String username = data['username'];
        return username;
      } else {
        return "Add Note "; 
      }
    } catch (error) {
      print("Error getting username: $error");
      return " Add Note";
    }
  }

Future<void> logout() async {
  final FirebaseAuth _auth=FirebaseAuth.instance;
    try {
      await _auth.signOut();
      print('Logged out');
    } catch (e) {
      print('Error logging out: $e');
    }
  }
}