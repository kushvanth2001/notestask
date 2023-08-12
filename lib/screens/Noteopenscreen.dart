import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NoteOpenscreen extends StatelessWidget {
  const NoteOpenscreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      body:Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        
        children: [
                 Container(margin: EdgeInsets.only(top:30,left: 15.w,right: 15.w ), child: Card(elevation: 4, child: ListTile(title: Text("Date of creation",style: TextStyle(    fontStyle: FontStyle.italic,),),subtitle: Text(Get.arguments[3],style: TextStyle(fontSize: 20.sp),)))),

        Container(margin: EdgeInsets.only(top:30,left: 15.w,right: 15.w ), child: Card(elevation: 4, child: ListTile(title: Text("Title",style: TextStyle(    fontStyle: FontStyle.italic,),),subtitle: Text(Get.arguments[1],style: TextStyle(fontSize: 20.sp),)))),
        

 Expanded(child: Container(margin: EdgeInsets.only(top:30,left: 15.w,right: 15.w ), child: Card(elevation: 4, child: ListTile(title: Text("note",style: TextStyle(    fontStyle: FontStyle.italic,),),subtitle: Text(Get.arguments[2],style: TextStyle(fontSize: 20.sp),)))))

        ],),

        
    ));
  }
}