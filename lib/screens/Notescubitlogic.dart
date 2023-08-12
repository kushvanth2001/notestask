import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notes_task/screens/Noteopenscreen.dart';
import 'package:notes_task/widgets/Notetile.dart';

import '../block/blockclasses.dart';

class Notecubitlogic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notecubit = context.watch<Notecubit>();
    final notes = notecubit.state.notes;
        final title = notecubit.state.title;
   if(title.isNotEmpty && notes.isNotEmpty){
          print(title);
          print(notes);
return ListView.builder(
  itemCount: notes.length,
  itemBuilder: (context, index) {
    
    return GestureDetector(child: NoteTile(text: notes[index].toString(),title: title[index],num:index),onTap: (){

Get.to(NoteOpenscreen(),arguments: [index,title[index],notes[index],notecubit.state.dateofcreation[index]]);

    },);
  },
);
        }
else{
  return Center(child: Text("Add some Notes"));
}
  
  }
}