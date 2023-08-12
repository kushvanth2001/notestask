import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notes_task/Firebasemethods/FirebaseAuth.dart';
import 'package:notes_task/block/blockclasses.dart';
import 'package:notes_task/main.dart';
import 'package:notes_task/screens/Noteaddscreen.dart';
import 'package:notes_task/screens/Notescubitlogic.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../block/blockstates.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
   String username='';
   var prefs;
  @override
  void initState() {
    super.initState();
    geto();
  }
  geto()async{
     prefs = await SharedPreferences.getInstance();
 username=(await Firebaseauth().getUserName())!;

  }
  @override
  Widget build(BuildContext context) {
       return BlocBuilder<Notecubit,NoteCubitState>(builder:(context,state){
if(state is NoteLoaded){
  Future.delayed(Duration(seconds: 3));
return     Scaffold(
        floatingActionButton: FloatingActionButton(child: const Icon(Icons.add),onPressed: (){Get.to(const Noteaddscreen(),arguments: [context]);}),
      appBar:AppBar(actions: [TextButton(onPressed: ()async{
        await prefs.clear();
await Firebaseauth().logout();
Get.offAllNamed('/signin');
      }, child: Text("logout"))],elevation: 4,title: Text("welcome ${username}",style: TextStyle(fontSize: 25.sp),),), 
     body: Notecubitlogic(), 
      
      
    );
}
else{
return CircularProgressIndicator();
}
      });
       
     
  }
}