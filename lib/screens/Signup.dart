import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:notes_task/screens/Homescreen.dart';
import 'package:notes_task/screens/signinscreen.dart';
import 'package:notes_task/Firebasemethods/Firebaseauth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
   SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var prefs;
  @override
  void initState() {
    super.initState();
    geto();
  }
  geto()async{
     prefs = await SharedPreferences.getInstance();

  }
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

    final TextEditingController _usenameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Padding(
       padding: EdgeInsets.symmetric(horizontal:24.w),
       child: Center(
         child: Column(
            mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [  Spacer(), Text("SignUp",style: TextStyle(fontStyle:FontStyle.italic,fontSize: 60),),SizedBox(height: 30,),
           TextField(controller: _emailController,decoration: InputDecoration(alignLabelWithHint: true,hintText: 'email',border:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),SizedBox(height: 30,),
           TextField(controller: _passwordController,decoration: InputDecoration(alignLabelWithHint: true,hintText: 'password',border:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),SizedBox(height: 30,),
           
            TextField(controller: _usenameController,decoration: InputDecoration(alignLabelWithHint: true,hintText: 'username',border:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),), SizedBox(height: 20.h,),
            ElevatedButton(onPressed: ()async{

var res=await Firebaseauth().SignupUser(_emailController.text,_passwordController.text,_usenameController.text);
if(res=='sucess'){
    if(!(await prefs.containsKey("email")) && ! (await prefs.containsKey("password"))){
     Future.delayed(Duration(seconds: 3), () async{
    Get.defaultDialog(
      title:"login sucessful",
      middleText: 'save the credentials and let us remember you',
      actions: [TextButton(onPressed: () async{
await prefs.setString("email",_emailController.text.trim());
print(await prefs.getString('email').toString());
 await   prefs.setString("password",_passwordController.text.trim());
    print(prefs.getString("password").toString());
     
    
     Get.back(); 
      }, child: Text("save credentials"))]
    ); 
  });}

Get.to(Homescreen());
}
else{
  print("something is wrong");
}
            }, child:Text("Signup") ),
            Spacer(), Padding(

              padding: EdgeInsets.all(24.h),
              child: Row(children: [Text('   Already have an account?  '),GestureDetector(child: Text("login",style: TextStyle(color: Colors.blue),),onTap: (){Get.to(SigninScreen());},)],),
            ),  ],),
       ),
     ),) ;
  }
}