

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:notes_task/Firebasemethods/FirebaseAuth.dart';
import 'package:notes_task/screens/Homescreen.dart';
import 'package:notes_task/screens/Signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninScreen extends StatefulWidget {
   SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  var prefs;
@override
  void initState() {
    super.initState();
    geto();
  }
  geto()async{
     prefs = await SharedPreferences.getInstance();
     
     if(await prefs.containsKey("email") && await prefs.containsKey("password")){
Get.defaultDialog(title: "previous credentials found login with them",actions: [TextButton(onPressed: () async{

 if(await prefs.getString("email").isNotEmpty && await prefs.getString("password").isNotEmpty){
var res=await Firebaseauth(). loginUser(await prefs.getString("email"),await prefs.getString("password"));
if(res=="sucess"){
  Get.off(Homescreen());
 }
 }

}, child: Text("login with them"))]);
     }
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
     double height=MediaQuery.of(context).size.width;
    return Scaffold(
     body: Padding(
       padding: EdgeInsets.symmetric(horizontal:24.w),
       child: Center(
         child: Column(
            mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [  Spacer(), Text("LogIn",style: TextStyle(fontStyle:FontStyle.italic,fontSize: 60),),SizedBox(height: 30,),
           TextField(controller: _emailController,decoration: InputDecoration(alignLabelWithHint: true,hintText: 'username',border:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),SizedBox(height: 30,),
           TextField(controller: _passwordController,decoration: InputDecoration(alignLabelWithHint: true,hintText: 'password',border:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
            SizedBox(height: 20.h,),
            ElevatedButton(onPressed: ()async{
              if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){
var res=await Firebaseauth(). loginUser(_emailController.text,_passwordController.text);
if(res=="sucess"){
  if(!(await prefs.containsKey("email")) && !(await prefs.containsKey("password"))){
     Future.delayed(Duration(seconds: 3), () async{
    Get.defaultDialog(
      title:"login sucessful",
      middleText: 'save the credentials and let us remember you',
      actions: [TextButton(onPressed: (){
 prefs.setString("email",_emailController.text);
    prefs.setString("password",_passwordController.text);
     Get.back(); 
      }, child: Text("save credentials"))]
    ); 
  });}
  Get.off(Homescreen());
}
              }else if(true){
                var res=Firebaseauth(). loginUser(_emailController.text,_passwordController.text);
                  Future.delayed(Duration(seconds: 3), () async{
       Get.defaultDialog(
      title: await res,
      middleText: 'please enter a valid string.',
    ); 
    });
              }

            }, child:Text("LogIn") ),
            Spacer(), Padding(

              padding: EdgeInsets.all(24.h),
              child: Row(children: [Text('   Dont have an account?  '),GestureDetector(child: Text("sign up",style: TextStyle(color: Colors.blue),),onTap: (){Get.to(SignupScreen());},)],),
            ),  ],),
       ),
     ),) ;
  }
}