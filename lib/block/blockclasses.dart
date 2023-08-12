import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_task/block/blockstates.dart';

import '../models/NotesModel.dart';
import '../screens/Notescubitlogic.dart';

class Notecubit extends Cubit<NoteCubitState>{

  Notecubit() : super(NoteInitial(notes: [],title: [],dateofcreation: [])) {
    _fetchNotesFromFirebase(); // Fetch initial notes from Firebase
  }

  Future<void> _fetchNotesFromFirebase() async {
    FirebaseFirestore _firebase=FirebaseFirestore.instance;
    FirebaseAuth _auth=FirebaseAuth.instance;
List<List<String>> list= await _firebase.collection('users').doc(_auth.currentUser!.uid).get().then((value) {


  Map<String, dynamic> data = value.data() as Map<String, dynamic>;
  List<dynamic> dynamicList1= data['titlelist'];
   List<dynamic> dynamicList2 = data['list'];
    List<dynamic> dynamicList3 = data['dateofcreation'];
  List<String> stringList1 = dynamicList1.map((item) => item.toString()).toList();
   List<String> stringList2 = dynamicList2.map((item) => item.toString()).toList();
    List<String> stringList3= dynamicList3.map((item) => item.toString()).toList();
List<List<String>> stringList=[];
stringList.add(stringList2);
stringList.add(stringList1);
stringList.add(stringList3);
 


  return stringList;
 });



    emit(NoteLoaded(list[0], list[1], list[2]));
  }

   void addNote(String noteText,String title) {
        final String formattedDate = DateFormat.yMd().add_Hm().format(DateTime.now());
    final List<String> updatedTitleList = [...state.title, title];
    final List<String> updatedNoteList = [...state.notes, noteText];
    final List<String> updatedDateList = [...state.dateofcreation, formattedDate];
    
    _updateFirebaseLists(updatedTitleList, updatedNoteList, updatedDateList);
    
  }

void deleteNoteAtIndex(int index) {
  final List<String> updatedTitleList = List.from(state.title)..removeAt(index);
  final List<String> updatedNoteList = List.from(state.notes)..removeAt(index);
  final List<String> updatedDateList = List.from(state.dateofcreation)..removeAt(index);

  _updateFirebaseLists(updatedTitleList, updatedNoteList, updatedDateList);
}
 void editNoteAtIndex(int index, String editednote,String editedtitle) {
  final List<String> updatedTitleList = List.from(state.title);
  final List<String> updatedNoteList = List.from(state.notes);
  

  updatedNoteList[index] = editednote;
  updatedTitleList[index]=editedtitle;

  _updateFirebaseLists(updatedTitleList, updatedNoteList, state.dateofcreation);
}

void _updateFirebaseLists(
    List<String> updatedTitleList,
    List<String> updatedNoteList,
    List<String> updatedDateList) {
  FirebaseFirestore _firebase = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  _firebase.collection('users').doc(_auth.currentUser!.uid).update({
    'titlelist': updatedTitleList,
    'list': updatedNoteList,
    'dateofcreation': updatedDateList,
  });

  emit(NoteLoaded(updatedNoteList, updatedTitleList, updatedDateList));
}
}