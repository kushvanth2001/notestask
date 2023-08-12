import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:notes_task/block/blockclasses.dart';
import 'package:notes_task/screens/Homescreen.dart';
import 'package:notes_task/screens/signinscreen.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
 options: DefaultFirebaseOptions.currentPlatform

   );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) =>
      BlocProvider<Notecubit>(
      
        create: (context) => Notecubit(),
        child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
         initialRoute: '/signin', // Start with the sign-in screen
        getPages: [
          GetPage(name: '/signin', page: () => SigninScreen()),
          GetPage(name: '/home', page: () => Homescreen()),
        ],
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
       
      ),),
  designSize: Size(375,667),  );
  }
}

class SignInScreen {
}


