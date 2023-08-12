

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../block/blockclasses.dart';

class Noteaddscreen extends StatefulWidget {
  const Noteaddscreen({super.key});

  @override
  State<Noteaddscreen> createState() => _NoteaddscreenState();
}

class _NoteaddscreenState extends State<Noteaddscreen> {
   TextEditingController _notecontoller=TextEditingController();
       TextEditingController _titlecontoller=TextEditingController();
  @override
  void initState() {
    super.initState();
    if( Get.arguments.length>1){
       _notecontoller.text=Get.arguments[3];
       _titlecontoller.text=Get.arguments[2];
    }
    
  }
  @override
  void dispose() {
    super.dispose();
    _notecontoller.dispose();
    _titlecontoller.dispose();

  }
  @override
  Widget build(BuildContext context) {
    final notecubit = BlocProvider.of<Notecubit>(Get.arguments[0]);
   
   
    
    return   Scaffold(
      extendBodyBehindAppBar: false,
      body: Column(
        children: [
           Container(
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.transparent,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [TextButton(onPressed: (){
if(_notecontoller.text.isNotEmpty &&  !(Get.arguments.length>1) ){
  
  notecubit.addNote(_notecontoller.text,_titlecontoller.text);
  Get.back();
}
else if( Get.arguments.length>1){
notecubit.editNoteAtIndex(Get.arguments[4], _titlecontoller.text, _notecontoller.text);
 Get.back();
}

else{
    Future.delayed(Duration(seconds: 3), () {
       Get.defaultDialog(
      title: 'Empty string is returned',
      middleText: 'please enter a valid string.',
    ); 
    });
}

                  }, child: Text("save",style: TextStyle(fontSize: 19.sp),))],),
                ),
             Expanded(
            child: Container(
              
              decoration: BoxDecoration(
            
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              padding: EdgeInsets.all(8.0),
              child: Card(
                color: Colors.purple.shade100,
                child: TextField(
                  controller: _titlecontoller,
                   maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Enter your Title',
                    border: InputBorder.none, // Hide the default border
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              
              decoration: BoxDecoration(
            
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              padding: EdgeInsets.all(8.0),
              child: Card(
                color: Colors.purple.shade100,
                child: TextField(
                  controller: _notecontoller,
                   maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Enter your Note',
                    border: InputBorder.none, // Hide the default border
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}