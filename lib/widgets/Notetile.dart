import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notes_task/screens/Noteaddscreen.dart';

import '../block/blockclasses.dart';

class NoteTile extends StatelessWidget {
  final String text;
    final String title;
    final int num;
  const NoteTile({super.key,required this.text,required this.title,required this.num});

  @override
  Widget build(BuildContext context) {
     final notecubit = BlocProvider.of<Notecubit>(context);

    return Card(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,style: TextStyle(fontSize: 19.sp),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Container(
            width: 250.w,
            
            child: Padding(
              padding: const EdgeInsets.only(left: 24,bottom: 30 ),
              child: Wrap(
                children: [
                  Text(text,style: TextStyle(fontWeight:FontWeight.w600,fontSize: 13.sp),),
                ],
              ),
            ),
          ),Spacer(),IconButton(onPressed: (){  notecubit.deleteNoteAtIndex(num);}, icon: Icon(Icons.delete)),IconButton(onPressed: (){Get.to(Noteaddscreen(),arguments: [context,true,title,text,num]);}, icon: Icon(Icons.edit))]),
      ],
    ),);
  }
}